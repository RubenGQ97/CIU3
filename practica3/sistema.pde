class sistema{
    
    HashMap<Integer,planeta> planetas;
    
    public sistema(){
      planetas = new HashMap<Integer,planeta>();
    }
    
    
    void anadirPlaneta(planeta nuevo){
      planetas.put(nuevo.getId(),nuevo);
    }
    
    planeta getPlaneta(int id){
      return planetas.get(id);
    }
    
    
    void mostrar(){
      for (HashMap.Entry<Integer, planeta> entry : planetas.entrySet()) {
          entry.getValue().actualizar();
         entry.getValue().dibujaPlaneta();
      }
    }
}
