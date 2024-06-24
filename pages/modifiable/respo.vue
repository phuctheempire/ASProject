<template>
  <div class="container mx-auto p-4">
    <div class="mb-8">
      <h1 class="text-3xl font-bold text-center">Plateforme de modification du responsable</h1>
      <h1 class="text-3xl font-bold text-center">Vous etes en charges du {{ valsport.name }} dans la ville de {{ valsport.city }}</h1>
    </div>

    <section class="mb-12">
      <h2 class="text-2xl font-semibold mb-4">Modification des horaires</h2>
      <div>
        <div v-for="(horaire, index) in horaires" :key="index" class="bg-white shadow-lg rounded-lg p-6 mb-6">
          <div v-if="!horaire.isEditing">
            <div class="mb-4">
              <h3 class="text-lg font-medium">Date</h3>
              <h4>{{ horaire.date }}</h4>
            </div>
            <div class="mb-4">
              <h3 class="text-lg font-medium">Heures</h3>
              <h4>{{ horaire.time }}</h4>
            </div>
            <div class="mb-4">
              <h3 class="text-lg font-medium">Lieu</h3>
              <h4>{{ horaire.lieu }}</h4>
            </div>
            <button @click="editHoraire(index)" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Modifier</button>
          </div>
          <div v-else>
            <form class="space-y-4"
              @submit.prevent="modifierHoraire(index)"
            >
              <!-- Form fields for editing news -->
              <div>
                <label class="block text-gray-700 text-sm font-bold mb-2" for="news-title">
                  Date
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="horaire-date" type="text" v-model="horaire.date" placeholder="Entrez le titre">
              </div>
              <div>
                <label class="block text-gray-700 text-sm font-bold mb-2" for="news-title">
                  Heures
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="horaire-heure" type="text" v-model="horaire.time" placeholder="Entrez le titre">
              </div>
              <div>
                <label class="block text-gray-700 text-sm font-bold mb-2" for="news-title">
                  Lieu
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="horaire-lieu" type="text" v-model="horaire.lieu" placeholder="Entrez le titre">
              </div>
              <button type="submit" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">Enregistrer</button>
              <button type="button" @click="cancelEditHoraire(index)" class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded">Annuler</button>
            </form>
          </div>
          <button @click="deleteHoraire(index)" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded mt-4">Supprimer</button>
        </div>
        <div class="bg-white shadow-lg rounded-lg p-6 mb-6">
          <div v-if="!isAddingHoraires">
            <button @click="isAddingHoraires = true" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Ajouter</button>
          </div>
          <div v-else>
            <form 
            @submit.prevent="ajoutHoraire"
            class="space-y-4">
              <!-- Form fields for adding new news -->
              <div>
                <label class="block text-gray-700 text-sm font-bold mb-2" for="new-horaires-date">
                  Date
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="new-horaires-date" type="text" v-model="newHoraire.date" placeholder="Entrez le date">
              </div>
              <div>
                <label class="block text-gray-700 text-sm font-bold mb-2" for="new-horaires-heures">
                  Heure
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="new-horaires-heures" type="text" v-model="newHoraire.time" placeholder="Entrez le heure">
              </div>
              <div>
                <label class="block text-gray-700 text-sm font-bold mb-2" for="new-horaires-lieu">
                  Lieu
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="new-news-lieu" type="text" v-model="newHoraire.lieu" placeholder="Entrez le lieu">
              </div>
              <button type="submit" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">Enregistrer</button>
              <button @click="isAddingHoraires = false" class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded">Annuler</button>
            </form>
          </div>
        </div>
      </div>
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
            <form class="space-y-4"
              @submit.prevent="modifierActu(index)"
            >
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
              <button type="submit" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">Enregistrer</button>
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
             @submit.prevent="modifierEvenement(index)"
            >
              <!-- Form fields for editing event -->
              <div>
                <label class="block text-gray-700 text-sm font-bold mb-2" for="event-title">
                  Titre
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="event-title" type="text" v-model="event.title" placeholder="Entrez le titre">
              </div>
              <div>
                <label class="block text-gray-700 text-sm font-bold mb-2" for="event-plan">
                  Plan
                </label>
                <textarea class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="event-plan" v-model="event.plan" placeholder="Entrez le plan"></textarea>
              </div>
              <button type="submit" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">Enregistrer</button>
              <button @click="cancelEditEvent(index)" class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded">Annuler</button>
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
    <ChangePass></ChangePass>
  </div>
</template>

<script setup>
// import {ChangePass} from '~/components/changePass.vue'
import { ref, onMounted } from 'vue';
definePageMeta({ middleware: 'verify' })


const {data} = useAuth()
const user = data._object['$sauth:data'].user
if (user.role !== 'responsable') {
  navigateTo('/')
}
// console.log(user)
// 

const sport = await useFetch('/api/sport/sport_by_id',{
  query: {
    id: user.sport_id
  }
})
const valsport = sport.data._value[0]



const filteredHoraires = valsport.plan
filteredHoraires.forEach( h => h.isEditing = false)


const filteredActualites = valsport.article
filteredActualites.forEach( a => a.isEditing = false)


const filteredEvents = valsport.evenement
filteredEvents.forEach( e => e.isEditing = false)


const horaires = ref(filteredHoraires);
const actualites = ref(filteredActualites);
const events = ref(filteredEvents);

// console.log(horaires.value)
// console.log(actualites.value)
// console.log(events.value)

const isAddingHoraires = ref(false);
const isAddingNews = ref(false);
const isAddingEvent = ref(false);

const newHoraire = ref({ date: '', time: '', lieu:''});
const newNews = ref({ titre: '', description: '', image: '' });
const newEvent = ref({ titre: '', plan: '' });

const editHoraire = (index) => {
  horaires.value[index].isEditing = true;
};
const cancelEditHoraire = (index) => {
  horaires.value[index].isEditing = false;
  // Optionally reset form fields or perform other actions needed on cancel
};
const deleteHoraire = (index) => {
  const {data, error} = useFetch(`/api/modifiable/deleteHoraires`, {
    method: "POST",
    body: {
      sport_id: horaires.value[index].sportid,
      id: horaires.value[index].id
    }
  })
  window.location.reload()
};
const modifierHoraire = async(index) => {
  const data = await useFetch(`/api/modifiable/updateHoraires`, {
    method: "POST",
    body: {
      sport_id: horaires.value[index].sportid,
      date: horaires.value[index].date,
      time: horaires.value[index].time,
      lieu: horaires.value[index].lieu,
      id: horaires.value[index].id
    }
  })
  horaires.value[index].isEditing = false;
  window.location.reload()
}
const ajoutHoraire = async() => {
  const { data, error } = await useFetch(`/api/modifiable/addHoraires`, {
    method: "POST",
    body: {
      sport_id: valsport.id,
      date: newHoraire.value.date,
      time: newHoraire.value.time,
      lieu: newHoraire.value.lieu,
    }
  })
  isAddingHoraires.value = false;
  newHoraire.value = { date: '', time: '', lieu: '' };
  window.location.reload()
}

const editNews = (index) => {
  actualites.value[index].isEditing = true;
};
const cancelEditNews = (index) => {
  actualites.value[index].isEditing = false;
  // Optionally reset form fields or perform other actions needed on cancel
};
const deleteNews = (index) => {
  const {data, error} = useFetch(`/api/modifiable/deleteActu`, {
    method: "POST",
    body: {
      sport_id : actualites.value[index].categoryid,
      id: actualites.value[index].id
    }
  })
  window.location.reload()
};
const modifierActu = async(index) => {
  const { data, error } = await useFetch(`/api/modifiable/updateActu`, {
    method: "POST",
    body: {
      sport_id : actualites.value[index].categoryid,
      title: actualites.value[index].title,
      description: actualites.value[index].description,
      image: actualites.value[index].image,
      id: actualites.value[index].id
    }
  })
  actualites.value[index].isEditing = false;
  window.location.reload()
}
const ajoutActu = async() => {
  const { data, error } = await useFetch(`/api/modifiable/addActu`, {
        method: "POST",
        body: {
            sport_id: valsport.id,
            title: newNews.value.titre,
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
const cancelEditEvent = (index) => {
  events.value[index].isEditing = false;
  // Optionally reset form fields or perform other actions needed on cancel
};
const deleteEvent = (index) => {
  const {data, error} = useFetch(`/api/modifiable/deleteEvenement`, {
    method: "POST",
    body: {
      sport_id: events.value[index].categoryid,
      id: events.value[index].id
    }
  })
  window.location.reload()
};
const modifierEvenement = async(index) => {
  const { data, error } = await useFetch(`/api/modifiable/updateEvenement`, {
        method: "POST",
        body: {
            sport_id: events.value[index].categoryid,
            title: events.value[index].title,
            plan: events.value[index].plan,
            id: events.value[index].id
          }
        })
        actualites.value[index].isEditing = false;
        window.location.reload()
      }
const adjoutEvenement = async( ) => {
        const { data, error } = await useFetch(`/api/modifiable/addEvenement`, {
              method: "POST",
              body: {
                  sport_id: valsport.id,
                  title: newEvent.value.titre,
                  plan: newEvent.value.plan,
              }
          })
          isAddingEvent.value = false;
          newEvent.value = { titre: '', plan: '' };
          window.location.reload()
      }
      
// const updateNews = (index) => {
//   actualites.value[index].isEditing = false;
//   // Save changes logic
// };

const old_pass = ref('')
const new_pass = ref('')
const confirm_pass = ref('')
const stat = ref('')
const mess = ref('')

onMounted(() => {
  const storedMessage = localStorage.getItem('message')
  const storedStatus = localStorage.getItem('status')
  if (storedMessage && storedStatus) {
    mess.value = storedMessage
    stat.value = storedStatus
    // alert(mess.value)
    // alert(stat.value)
    
    localStorage.removeItem('message')
    localStorage.removeItem('status')
  }
})

const change_password = async() => {
  const {data, error} = useFetch(`/api/protected_action/change_pass`, {
    method: "POST",
    body: {
      id: user.id,
      old_password: old_pass.value,
      new_password: new_pass.value,
      confirm_password: confirm_pass.value,
    }
  })
  // console.log(data)
  localStorage.setItem('message', data.value.message)
  localStorage.setItem('status', data.value.status)
  // alert(data.value.message)
  window.location.reload()
}

// const updateEvent = (index) => {
//   events.value[index].isEditing = false;
//   // Save changes logic
// };


// const addEvent = () => {
//   events.value.push({ ...newEvent.value, isEditing: false });
//   isAddingEvent.value = false;
//   newEvent.value = { titre: '', plan: '' };
//   // Save new event logic
// };



</script>

<style>
/* Add any custom styles here if needed */
</style>
