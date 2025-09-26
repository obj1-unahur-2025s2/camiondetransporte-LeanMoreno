import cosas.*

object camion {
    const carga = []

    method cargar(unaCosa){
        carga.add(unaCosa)
        unaCosa.consecuenciasDeLaCarga()
    }

    method descargar(unaCosa){
        carga.remove(unaCosa)
    }

    method pesoTotal() = 1000 + carga.sum({cosa => cosa.peso()}) //El "sum" si no hay nada devuelve 0.

    //"all" devuelve true si todos los elementos de la lista cumple la condicion del closure.
    method todosPesoPar() = carga.all({cosa => cosa.esPesoPar()})

    //"all" y "any" aceptan que la lista este vacia. En cambio "max" NO.
    //"any" devuelve un booleano si alguno de los elementos cumple la condicion del closure.
    method algunaCosaPesa(unPeso){
        return carga.any({cosa => cosa.peso() == unPeso})
    }

    //"find" devuelve el primer objeto (no un valor, o un booleano) que cumpla con la condicion del closure.
    method primerCosaConPeligrosidad(unValor){
        return carga.find({cosa => cosa.peligrosidad() == unValor})
    }

    //"filter" devuelve una lista con los objetos que cumplan la condicion del closure.
    method todasLasCosasConMasPeligrosidadQue(unValor){
        return carga.filter({cosa => cosa.peligrosidad() > unValor})
    }

    method cosasSuperanPeligrosidadDe(unaCosa){
        return carga.filter({cosa => cosa.peligrosidad() > unaCosa.peligrosidad()})
    }

    method excedePesoMaximo() = self.pesoTotal() > 2500

    method puedeCircularEnRuta(nivelMaximo){
        return !self.excedePesoMaximo() && self.todasLasCosasConMasPeligrosidadQue(nivelMaximo).isEmpty()
    }

    method algunaCosaPesaEntre(valorMinimo, valorMaximo){
        return carga.any({cosa => cosa.peso().between(valorMinimo, valorMaximo)})
    }

    method cosaMasPesada(){
        return carga.max({cosa => cosa.peso()}) //Devuelve EL OBJETO (no el valor de su peso) que tenga el mayor peso.
    }
}