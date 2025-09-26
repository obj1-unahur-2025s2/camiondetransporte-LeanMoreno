object knightRaider {
    method peso(){
        return 500
    }

    method peligrosidad(){
        return 10
    }

    method esPesoPar() = self.peso().even() //"even()" indica si un numero es par.

    method bultos() = 1

    method consecuenciasDeLaCarga() {} //No hace nada.
}

object bumblebee{
  var esAuto = true //Siempre que un objeto se transforma o "cambia" de lugar usamos un booleano.

  method peso(){
    return 800
  }

  method trasformateEnAuto(){
    esAuto = true
  }

  method transformateEnRobot(){
    esAuto = false
  }

  method peligrosidad() = if(esAuto) 15 else 30 // Expresion ternaria

  method esPesoPar() = self.peso().even()

  method bultos() = 2

  method consecuenciasDeLaCarga(){
    self.transformateEnRobot()
  }
}

object ladrillos{
    var cantidad = 10

    method cantidad(nuevaCantidad){ //Nos permite cambiar la cantidad de ladrillos.
        cantidad = nuevaCantidad.max(0) //Esto es para que el minimo sea siempre 0.
    }

    method peso() = 2*cantidad

    method peligrosidad() = 2

    method esPesoPar() = self.peso().even()

    method bultos(){ //Forma de hacer if y elseif en wollok.
        return
        if(cantidad <= 100){1}
        else if(cantidad.between(101, 300)){2}
        else {3}
    }

    method consecuenciasDeLaCarga(){
        cantidad = cantidad + 12
    }
}

object arena{
    var peso = 0

    method peso(nuevoPeso){
        peso = nuevoPeso
    }

    method peso() = peso

    method peligrosidad() = 1

    method esPesoPar() = self.peso().even()

    method bultos() = 1

    method consecuenciasDeLaCarga(){
        peso = (peso - 10).max(0) //El max es para que la resta no te de negativo.
    }
}

object bateria{
    var estaConMisiles = false

    method cargarMisiles(){
        estaConMisiles = true
    }

    method descargarMisiles(){
        estaConMisiles = false
    }

    method peso() = if(estaConMisiles) 300 else 200

    method peligrosidad() = if(estaConMisiles) 100 else 0

    method esPesoPar() = self.peso().even()

    method bultos() = if(estaConMisiles) 2 else 1

    method consecuenciasDeLaCarga(){
        self.cargarMisiles()
    }
}

object contenedor{
    const cosasAdentro = [] //Cuando usamos listas es una constante.

    method agregarCosa(unaCosa){
        cosasAdentro.add(unaCosa) //Forma de agregar una cosa a una lista
    }

    method agregarVariasCosas(variasCosas){
        cosasAdentro.addAll(variasCosas) //Forma de agregar varios elementos a la lista.
    }

    method quitarCosa(unaCosa){
        cosasAdentro.remove(unaCosa) //Forma de eliminar un elemento de una lista.
    }

    //"cosa" es un nombre cualquiera, puede ir cualquier nombre que va a funcar igual.
    method peso() = 100 + cosasAdentro.sum({cosa => cosa.peso()}) //Recorre y suma todos los pesos de los elementos de la lista.

    //"max" devuelve un objeto, no devuelve el valor. Por lo que hay que pedirle ese valor al objeto
    method peligrosidad() =
        if(cosasAdentro.isEmpty()) 0
        else cosasAdentro.max({cosa => cosa.peligrosidad()}).peligrosidad() //Aca se le pide el valor al objeto que devolvio "max"
        //Esto de arriba sigue siendo una expresion ternaria.

    method esPesoPar() = self.peso().even()

    method bultos() = 1 + cosasAdentro.sum({cosa => cosa.bultos()})

    //"forEach" no devuelve nada, solo les manda un mensaje de indicacion a cada elemento de la lista.
    method consecuenciasDeLaCarga(){
        if(!cosasAdentro.isEmpty())
            cosasAdentro.forEach({cosa => cosa.consecuenciasDeLaCarga()})
    }
}

object residuos{
    var property peso = 0 //"property" te arma los metodos de indicacion y de consulta de peso.
    method peligrosidad() = 200

    method esPesoPar() = self.peso().even()

    method bultos() = 1

    method consecuenciasDeLaCarga(){
        peso = peso + 15
    }
}

object embalaje{
    var cosaEnvuelta = arena //Se inicializa con un objeto que ya tengamos hecho.

    method envolver(unaCosa){
        cosaEnvuelta = unaCosa
    }

    method peso() = cosaEnvuelta.peso()

    method peligrosidad() = cosaEnvuelta.peligrosidad()/2 //Se le pregunta al objeto que tiene dentro su nivel de peligro.

    method esPesoPar() = self.peso().even()

    method bultos() = 2

    method consecuenciasDeLaCarga() {}
}

object nada {
  method peso() = 0 //Estos dos metodos son el polimorfismo del ejercicio, todos los objetos deben entender estos mensajes.
  method peligrosidad() = 0

  method esPesoPar() = self.peso().even()
}