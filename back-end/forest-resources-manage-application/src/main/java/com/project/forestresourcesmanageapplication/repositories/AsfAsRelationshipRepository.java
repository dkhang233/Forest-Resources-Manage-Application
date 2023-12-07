package com.project.forestresourcesmanageapplication.repositories;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.project.forestresourcesmanageapplication.models.AnimalSpecies;
import com.project.forestresourcesmanageapplication.models.AsfAsRelationship;
import com.project.forestresourcesmanageapplication.responses.AnimalMonthQuantity;
import com.project.forestresourcesmanageapplication.responses.AnimalQuarterQuantity;
import com.project.forestresourcesmanageapplication.responses.AnimalsQuantity;
import com.project.forestresourcesmanageapplication.responses.FacilitiesQuantity;
import com.project.forestresourcesmanageapplication.responses.MonthQuantity;

@Repository
public interface AsfAsRelationshipRepository extends JpaRepository<AsfAsRelationship,Integer> {
    @Query("SELECT a FROM AsfAsRelationship a WHERE a.date BETWEEN :startDate AND :endDate")
    Optional<List<AsfAsRelationship>> selectAsfAsRelationshipWithTime(@Param("startDate") Date startDate, @Param("endDate") Date endDate);

    @Query("SELECT a.animalStorageFacilities, SUM(a.quantity) quantity FROM AsfAsRelationship a WHERE a.animalStorageFacilities.code = :code AND a.date BETWEEN :startDate AND :endDate")
    Optional<List<AsfAsRelationship>> selectAsfAsRelationshipByFacilitiesInYear(@Param("code") String code, @Param("startDate") Date startDate, @Param("endDate") Date endDate);

    @Query("SELECT a.animalSpecies FROM AsfAsRelationship a WHERE a.animalStorageFacilities.code = :code")
    Optional<List<AnimalSpecies>> selectAllAnimalSpeciesByFacilitiesCode(String code);

    @Query("SELECT a FROM AsfAsRelationship a WHERE a.animalStorageFacilities.code = :code AND a.animalSpecies.name = :name")
    Optional<List<AsfAsRelationship>> selectAsfAsRelationshipByAnimalAndCode(@Param("code") String code, @Param("name") String name);

    @Query("SELECT a FROM AsfAsRelationship a WHERE a.animalStorageFacilities.code = :code AND a.animalSpecies.name = :name AND a.date <= :date ")
    Optional<List<AsfAsRelationship>> selectAsfAsRelationshipBeforeTime(@Param("code") String code, @Param("name") String name , @Param("date") Date date);

    @Query("SELECT NEW com.project.forestresourcesmanageapplication.responses.FacilitiesQuantity(a.animalStorageFacilities.code , SUM(a.quantity)) " 
        +" FROM AsfAsRelationship a WHERE a.date <= :date"
        +" GROUP BY a.animalStorageFacilities")
   List<FacilitiesQuantity> selectAllQuantityOfFacilities(@Param("date") Date date);


    @Query("SELECT NEW com.project.forestresourcesmanageapplication.responses.AnimalsQuantity(a.animalStorageFacilities.name , a.animalSpecies.name , SUM(a.quantity) ) " 
        +" FROM AsfAsRelationship a WHERE a.date <= :date"
        +" GROUP BY a.animalStorageFacilities, a.animalSpecies"
        +" ORDER BY a.animalStorageFacilities.code , a.animalSpecies.name DESC")
   List<AnimalsQuantity> selectAllQuantityOfAllAnimal(@Param("date") Date date);


    @Query("SELECT SUM(a.quantity) AS quantity FROM AsfAsRelationship a"
        +" WHERE a.animalStorageFacilities.name = :name AND a.date <= :date"
        +" GROUP BY a.animalStorageFacilities")
    Optional<Long> getMonthQuantityOfFacilities(@Param("name") String name, @Param("date") Date date);

    @Query("SELECT NEW com.project.forestresourcesmanageapplication.responses.AnimalMonthQuantity(a.animalStorageFacilities.name , NEW com.project.forestresourcesmanageapplication.responses.MonthQuantity(:month , SUM(a.quantity) ))" 
        +" FROM AsfAsRelationship a WHERE a.date <= :date"
        +" GROUP BY a.animalStorageFacilities"
        +" ORDER BY a.animalStorageFacilities.name DESC")
    Optional<List<AnimalMonthQuantity>> selectMonthQuantityOfFacilities(@Param("month") int month , @Param("date") Date date);
    
    // @Query("SELECT NEW com.project.forestresourcesmanageapplication.responses.AnimalMonthQuantity(a.animalStorageFacilities.name , a.animalSpecies.name , NEW com.project.forestresourcesmanageapplication.responses.AnimalQuarterQuantity(:quarter , :quarterQuantity))" 
    //     +" FROM AsfAsRelationship a WHERE a.animalSpecies.name = :name AND a.date <= :date "
    //     +" GROUP BY a.animalStorageFacilities, a.animalSpecies"
    //     +" ORDER BY a.animalStorageFacilities.name , a.animalSpecies.name DESC")
    // Optional<List<AnimalQuarterQuantity>> selectQuarterQuantityByAnimalNameWithQuarter(@Param("quarter") int month ,@Param("quarterQuantity") long quarterQuantity ,@Param("name") String name , @Param("date") Date date);
    

}
