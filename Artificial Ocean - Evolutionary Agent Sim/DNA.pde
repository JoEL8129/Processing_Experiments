class DNA {
  float [] genes;

  DNA() {

    genes = new float[20];
    for (int i = 0; i< genes.length; i++) {
      genes[i] = random(0, 1);
    }
  }

  DNA(float [] newgenes) {
    genes = newgenes;
  }

  DNA crossover(DNA partner) {
    float[] child = new float[genes.length];
    int crossover = int(random(genes.length));
    child[0] = random(0, 1);

    for (int i = 1; i < genes.length; i++) {
      child[i] = random(genes[i], partner.genes[i]);
    }
    DNA newgenes = new DNA(child);
    return newgenes;
  }


  DNA copy() {

    float[] newgenes = new float[genes.length];
    for (int i = 0; i < newgenes.length; i++) {
      newgenes[i] = genes[i];
    } 
    return new DNA(newgenes);
  }

  void mutate(float m) {
    for (int i = 0; i < genes.length; i++) {
      if (random(1) < m) {
        genes[i] = random(0, 1);
      }
    }
  }
}
