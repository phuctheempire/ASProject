<template>
  <div class="container mx-auto p-4">
    <h1 class="text-3xl font-bold mb-4">Responsables par sport à Blois</h1>

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
          id: 13,
          nom: 'Badminton',
          responsables: [
            { id: 21, prenom: 'jsp', nom: 'jsp', email: 'manon.ducelier@insa-cvl.fr' }
          ]
        },
        {
          id: 14,
          nom: 'Basket',
          responsables: [
            { id: 22, prenom: 'noidea', nom: 'noidea', email: 'hugo.leseine-bescond@insa-cvl.fr' }
          ]
        },
        {
          id: 15,
          nom: 'Cheer',
          responsables: [
            { id: 23, prenom: 'Lola', nom: 'Bassereau', email: 'lola.bassereau@insa-cvl.fr' }
          ]
        },
        {
          id: 16,
          nom: 'Foot',
          responsables: [
            { id: 24, prenom: 'toto', nom: 'toto', email: 'toto.toto@insa-cvl.fr' }
          ]
        },
        {
          id: 17,
          nom: 'Handball',
          responsables: [
            { id: 25, prenom: 'titi', nom: 'titi', email: 'titi.titi@insa-cvl.fr' }
          ]
        },
        {
          id: 18,
          nom: 'Rugby',
          responsables: [
            { id: 26, prenom: 'tata', nom: 'tata', email: 'tata.tata@insa-cvl.fr' }
          ]
        },
        {
          id: 19,
          nom: 'Tennis',
          responsables: [
            { id: 27, prenom: 'tutu', nom: 'tutu', email: 'tutu.tutu@insa-cvl.fr' }
          ]
        },
        {
          id: 20,
          nom: 'Ultimate',
          responsables: [
            { id: 28, prenom: 'lo', nom: 'lo', email: 'lo.lo@insa-cvl.fr' }
          ]
        },
        {
          id: 21,
          nom: 'Volley',
          responsables: [
            { id: 29, prenom: 'li', nom: 'li', email: 'li.li@insa.fr' }
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