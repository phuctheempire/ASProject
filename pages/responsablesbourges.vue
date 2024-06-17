<template>
  <div class="container mx-auto p-4">
    <h1 class="text-3xl font-bold mb-4">Responsables par sport à Bourges</h1>

    <!-- Liste des sports avec leurs responsables -->
    <div v-for="sport in sports" :key="sport.id" class="mb-8">
      <h2 class="text-2xl font-semibold mb-2">{{ sport.nom }}</h2>

      <!-- Liste des responsables pour ce sport -->
      <div v-for="(responsable, index) in sport.responsables" :key="index" class="mb-4">
        <h3 class="text-xl font-semibold mb-2">{{ responsable.prenom }} {{ responsable.nom }}</h3>
        <p class="mb-2"><strong>Email:</strong> {{ responsable.email }}</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      sports: [
        {
          id: 1,
          nom: 'Aviron',
          responsables: [
            { id: 1, prenom: 'Brice', nom: 'Athey', email: 'brice.athey-fougerouse@insa-cvl.fr' },
            { id: 2, prenom: 'Paul', nom: 'Laurent', email: 'paul.laurent@insa-cvl.fr' }
          ]
        },
        {
          id: 2,
          nom: 'Badminton',
          responsables: [
            { id: 3, prenom: 'Manon', nom: 'Ducelier', email: 'manon.ducelier@insa-cvl.fr' },
            { id: 4, prenom: 'Romane', nom: 'Fouilhe', email: 'romane.fouilhe@insa-cvl.fr' }
          ]
        },
        {
          id: 3,
          nom: 'Basket',
          responsables: [
            { id: 5, prenom: 'Hugo', nom: 'Leseine-Bescond', email: 'hugo.leseine-bescond@insa-cvl.fr' }
          ]
        },
        {
          id: 4,
          nom: 'Cheer',
          responsables: [
            { id: 6, prenom: 'Capucine', nom: 'Desille-Cocherie', email: 'capucine.desille-cocherie@insa-cvl.fr' },
            { id: 7, prenom: 'Ines', nom: 'Rezzoug', email: 'ines.rezzoug@insa-cvl.fr' }
          ]
        },
        {
          id: 5,
          nom: 'Foot',
          responsables: [
            { id: 8, prenom: 'Thibaut', nom: 'Paillat', email: 'thibaut.paillat@insa-cvl.fr' },
            { id: 9, prenom: 'Romain', nom: 'Laye', email: 'romain.laye@insa-cvl.fr' }
          ]
        },
        {
          id: 6,
          nom: 'Handball',
          responsables: [
            { id: 10, prenom: 'Céleste', nom: 'Le Guen', email: 'celeste.le_guen@insa.fr' },
            { id: 11, prenom: 'Thomas', nom: 'Mortagne', email: 'thomas.mortagne@insa-cvl.fr' }
          ]
        },
        {
          id: 7,
          nom: 'Natation',
          responsables: [
            { id: 12, prenom: 'Sylvain', nom: 'Vaukan', email: 'sylvain.vaukan@insa-cvl.fr' }
          ]
        },
        {
          id: 8,
          nom: 'Rugby',
          responsables: [
            { id: 13, prenom: 'Alexandre', nom: 'Desfontaines', email: 'alexandre.desfontaines@insa-cvl.fr' }
          ]
        },
        {
          id: 9,
          nom: 'Running',
          responsables: [
            { id: 14, prenom: 'Juliette', nom: 'Alzon', email: 'juliette.alzon@insa-cvl.fr' },
            { id: 15, prenom: 'Emile', nom: 'Rabache', email: 'emile.rabache@insa-cvl.fr' }
          ]
        },
        {
          id: 10,
          nom: 'Tennis',
          responsables: [
            { id: 16, prenom: 'Ludovick', nom: 'Lainé', email: 'ludovick.laine@insa-cvl.fr' }
          ]
        },
        {
          id: 11,
          nom: 'Ultimate',
          responsables: [
            { id: 17, prenom: 'Eva', nom: 'Bornot', email: 'eva.bornot@insa-cvl.fr' },
            { id: 18, prenom: 'Nolan', nom: 'Parreau', email: 'nolan.parreau@insa-cvl.fr' }
          ]
        },
        {
          id: 12,
          nom: 'Volley',
          responsables: [
            { id: 19, prenom: 'Salomé', nom: 'Le Dez', email: 'salome.le_dez@insa-cvl.fr' },
            { id: 20, prenom: 'Quentin', nom: 'Descloux', email: 'quentin.descloux@insa.fr' }
          ]
        }
      ]
    }
  }
}
</script>

<style scoped>
/* Styles spécifiques à cette page si nécessaire */
</style>
