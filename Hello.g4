grammar Hello;


@lexer::members{
    int num_linea = 1;

}

r : (ENCABEZADO|FRASE|SALTO_LINEA|LINEA_HORIZONTAL|IGNORE)+;

ENCABEZADO: '#' + FRASE{
    String frase = getText();
    int numero_h = 0;
    while(frase.charAt(numero_h) == '#'){
        numero_h += 1;
    }
    if(numero_h > 6){
        System.err.println("Error en la linea " + num_linea+ ", no puede haber mas de 6 hastags");
    }else if(frase.charAt(numero_h) != ' '){
        System.err.println("Error en la linea " + num_linea +" falta un espacio entre los hastagas y la palabra");
    }else{
        System.out.println("<H"+ numero_h +">" + frase.substring(numero_h+1, frase.length()) + "</H" + numero_h + ">" );
    }
};


FRASE : (PALABRA|ESPACIO)+{
    System.out.println(getText());
};

SALTO_LINEA : '\n'{
    num_linea = num_linea + 1;
};

LINEA_HORIZONTAL: '-'+{
    if(getText().length() >= 3){
        System.out.println("<HR/>");
    }
};

CITA: '>'FRASE{
    String frase = getText();
    if(frase.charAt(1)!=' '){
        System.err.println("Falta un espacio en la linea " + num_linea);
    }else{
        System.out.println("<blockquote>");
        System.out.println(frase.substring(2, frase.length()));
        System.out.println("</blockquote>");
    }
};


CODIGO: '~~~' (~'~' )  '~~~'; // cerrar comentario en java

fragment PALABRA : [a-zA-Z]+;
fragment ESPACIO : ' ';

IGNORE : . -> skip;