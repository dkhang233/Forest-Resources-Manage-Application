package com.project.forestresourcesmanageapplication.exceptionhandling;

public class DataAlreadyExistsException extends RuntimeException{
    public DataAlreadyExistsException(String message){
        super(message);
    }    
}
