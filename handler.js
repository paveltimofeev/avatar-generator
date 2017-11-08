'use strict';

function getCached( id ){
    
}

function toCache( id, data ){
    
}

function generateNew( id ){
    
    var generator = require('./lib/avatar-generator')();
    
    try {
        
        //var out = require('fs').createWriteStream( 'putin.png' );
        //generator('putin', 'female', 400).stream();//.pipe(out);
        generator( id, 'male', 400).write( id+'.png', console.error );
    }
    catch (err) {
        console.error(err);
    }
}


module.exports. handler = function(event, context){
    
    var upic = getCached( id );
    if( !upic ){
        
        generateNew( id, function(err,data){
            
            upic = data;
            toCache( id, data );
            return upic;
            //return err; 
        });
    } 
    else {
        
        //
        return upic;
    }
}
