<template>
  <div class="container mx-auto p-4">
    <div class="mb-8">
      <h1 class="text-3xl font-bold text-center">Plateforme de modification du responsable</h1>
      <h1 class="text-3xl font-bold text-center">Vous etes en charges du {{ roleSport[0].name }} dans la ville de {{ roleSport[0].city }}</h1>
    </div>

    <section class="mb-12">
      <h2 class="text-2xl font-semibold mb-4">Modification des horaires</h2>
      <form class="bg-white shadow-lg rounded-lg p-6 space-y-4">
        <!-- Form content for modifying schedule -->
        <div>
          <label class="block text-gray-700 text-sm font-bold mb-2" for="schedule">
            Horaire
          </label>
          <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="schedule" type="text" placeholder="Entrez les horaires">
        </div>
      </form>
    </section>

    <section class="mb-12">
      <h2 class="text-2xl font-semibold mb-4">Modification des actualités</h2>
      <div>
        <div v-for="(news, index) in actualites" :key="index" class="bg-white shadow-lg rounded-lg p-6 mb-6">
          <div v-if="!news.isEditing">
            <div class="mb-4">
              <h3 class="text-lg font-medium">Titre</h3>
              <h4>{{ news.title }}</h4>
            </div>
            <div class="mb-4">
              <h3 class="text-lg font-medium">Description</h3>
              <h4>{{ news.description }}</h4>
            </div>
            <div class="mb-4">
              <h3 class="text-lg font-medium">Image</h3>
              <img :src="news.image" alt="News Image" class="rounded-lg mb-4">
            </div>
            <button @click="editNews(index)" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Modifier</button>
          </div>
          <div v-else>
            <form class="space-y-4">
              <!-- Form fields for editing news -->
              <div>
                <label class="block text-gray-700 text-sm font-bold mb-2" for="news-title">
                  Titre
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="news-title" type="text" v-model="news.title" placeholder="Entrez le titre">
              </div>
              <div>
                <label class="block text-gray-700 text-sm font-bold mb-2" for="news-description">
                  Description
                </label>
                <textarea class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="news-description" v-model="news.description" placeholder="Entrez la description"></textarea>
              </div>
              <div>
                <label class="block text-gray-700 text-sm font-bold mb-2" for="news-image">
                  Image URL
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="news-image" type="text" v-model="news.image" placeholder="Entrez l'URL de l'image">
              </div>
              <button type="button" @click="updateNews(index)" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">Enregistrer</button>
              <button type="button" @click="cancelEditNews(index)" class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded">Annuler</button>
            </form>
          </div>
          <button @click="deleteNews(index)" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded mt-4">Supprimer</button>
        </div>

        <div class="bg-white shadow-lg rounded-lg p-6 mb-6">
          <div v-if="!isAddingNews">
            <button @click="isAddingNews = true" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Ajouter</button>
          </div>
          <div v-else>
            <form 
            @submit.prevent="ajoutActu"
            class="space-y-4">
              <!-- Form fields for adding new news -->
              <div>
                <label class="block text-gray-700 text-sm font-bold mb-2" for="new-news-title">
                  Titre
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="new-news-title" type="text" v-model="newNews.titre" placeholder="Entrez le titre">
              </div>
              <div>
                <label class="block text-gray-700 text-sm font-bold mb-2" for="new-news-description">
                  Description
                </label>
                <textarea class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="new-news-description" v-model="newNews.description" placeholder="Entrez la description"></textarea>
              </div>
              <div>
                <label class="block text-gray-700 text-sm font-bold mb-2" for="new-news-image">
                  Image URL
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="new-news-image" type="text" v-model="newNews.image" placeholder="Entrez l'URL de l'image">
              </div>
              <button type="submit" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">Enregistrer</button>
              <button @click="isAddingNews = false" class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded">Annuler</button>
            </form>
          </div>
        </div>
      </div>
    </section>

    <section class="mb-12">
      <h2 class="text-2xl font-semibold mb-4">Modification des événements</h2>
      <div>
        <div v-for="(event, index) in events" :key="index" class="bg-white shadow-lg rounded-lg p-6 mb-6">
          <div v-if="!event.isEditing">
            <div class="mb-4">
              <h3 class="text-lg font-medium">Titre</h3>
              <h4>{{ event.title }}</h4>
            </div>
            <div class="mb-4">
              <h3 class="text-lg font-medium">Plan</h3>
              <h4>{{ event.plan }}</h4>
            </div>
            <button @click="editEvent(index)" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Modifier</button>
          </div>
          <div v-else>
            <form class="space-y-4"
            >
              <!-- Form fields for editing event -->
              <div>
                <label class="block text-gray-700 text-sm font-bold mb-2" for="event-title">
                  Titre
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="event-title" type="text" v-model="event.titre" placeholder="Entrez le titre">
              </div>
              <div>
                <label class="block text-gray-700 text-sm font-bold mb-2" for="event-plan">
                  Plan
                </label>
                <textarea class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="event-plan" v-model="event.plan" placeholder="Entrez le plan"></textarea>
              </div>
              <button type="button" @click="updateEvent(index)" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">Enregistrer</button>
            </form>
          </div>
          <button @click="deleteEvent(index)" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded mt-4">Supprimer</button>
        </div>

        <div class="bg-white shadow-lg rounded-lg p-6 mb-6">
          <div v-if="!isAddingEvent">
            <button @click="isAddingEvent = true" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Ajouter</button>
          </div>
          <div v-else>
            <form class="space-y-4"
              @submit.prevent="adjoutEvenement"
            >
              <!-- Form fields for adding new event -->
              <div>
                <label class="block text-gray-700 text-sm font-bold mb-2" for="new-event-title">
                  Titre
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="new-event-title" type="text" v-model="newEvent.titre" placeholder="Entrez le titre">
              </div>
              <div>
                <label class="block text-gray-700 text-sm font-bold mb-2" for="new-event-plan">
                  Plan
                </label>
                <textarea class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="new-event-plan" v-model="newEvent.plan" placeholder="Entrez le plan"></textarea>
              </div>
              <button type="submit" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">Enregistrer</button>
              <button @click="isAddingEvent = false" class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded">Annuler</button>
            </form>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
import { ref } from 'vue';


const {data} = useAuth()
const user = data._object['$sauth:data'].user
// console.log(user)
// 

const sport = await useFetch('/api/content/sport')
const valsport = sport.data._value
// console.log(valsport)


const roleSport = valsport.filter( s => s.accid === user.id)
console.log(roleSport)

const actua = await useFetch('/api/content/article')
const valarticle = actua.data._value
const filteredActualites = valarticle.filter( a => a.categoryid === roleSport[0].id)
filteredActualites.forEach( a => a.isEditing = false)


const evene = await useFetch('/api/content/evenement')
const valevenement = evene.data._value
const filteredEvents = valevenement.filter( e => e.categoryid === roleSport[0].id)
filteredEvents.forEach( e => e.isEditing = false)

const actualites = ref(filteredActualites);

const events = ref(filteredEvents);

const isAddingNews = ref(false);
const isAddingEvent = ref(false);

const newNews = ref({ titre: '', description: '', image: '' });
const newEvent = ref({ titre: '', plan: '' });

const editNews = (index) => {
  actualites.value[index].isEditing = true;
};

const cancelEditNews = (index) => {
  actualites.value[index].isEditing = false;
  // Optionally reset form fields or perform other actions needed on cancel
};

const updateNews = (index) => {
  actualites.value[index].isEditing = false;
  // Save changes logic
};

const deleteNews = (index) => {
  actualites.value.splice(index, 1);
};

const addNews = () => {
  actualites.value.push({ ...newNews.value, isEditing: false });
  
  // Save new news logic
};

const ajoutActu = async() => {
  const { data, error } = await useFetch(`/api/modifiable/addActu`, {
        method: "POST",
        body: {
            title: newNews.value.titre,
            categoryid: roleSport[0].id,
            description: newNews.value.description,
            image: newNews.value.image,

        }
    })
    isAddingNews.value = false;
    newNews.value = { titre: '', description: '', image: '' };
    window.location.reload()
}

const editEvent = (index) => {
  events.value[index].isEditing = true;
};

const updateEvent = (index) => {
  events.value[index].isEditing = false;
  // Save changes logic
};

const deleteEvent = (index) => {
  events.value.splice(index, 1);
};

const addEvent = () => {
  events.value.push({ ...newEvent.value, isEditing: false });
  isAddingEvent.value = false;
  newEvent.value = { titre: '', plan: '' };
  // Save new event logic
};

const adjoutEvenement = async() => {
  const { data, error } = await useFetch(`/api/modifiable/addEvenement`, {
        method: "POST",
        body: {
            title: newEvent.value.titre,
            categoryid: roleSport[0].id,
            plan: newEvent.value.plan,
        }
    })
    isAddingEvent.value = false;
    newEvent.value = { titre: '', plan: '' };
    window.location.reload()
}


</script>

<style>
/* Add any custom styles here if needed */
</style>
