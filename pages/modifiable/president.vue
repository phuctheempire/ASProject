<template>
  <div class="container mx-auto px-4 py-8">
    <div class="flex justify-between items-center mb-8">
      <h1 class="text-3xl font-bold text-purple-800">Sports</h1>
      <button @click="showAddForm = true" class="bg-purple-600 text-white py-2 px-4 rounded-lg hover:bg-purple-700 focus:outline-none">Add Sport</button>
    </div>

    <transition name="fade">
      <div v-if="showAddForm" class="fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-50">
        <div class="bg-white p-8 rounded-lg shadow-md max-w-md w-full">
          <h2 class="text-xl font-semibold mb-4">Add Sport</h2>
          <form @submit.prevent="addSport">
            <div class="mb-4">
              <label for="name" class="block text-gray-700">Sport Name</label>
              <input v-model="newSport.name" type="text" id="name" class="mt-1 p-2 border border-gray-300 rounded-lg w-full focus:outline-none focus:border-purple-500" required />
            </div>
            <div class="mb-4">
              <label for="city" class="block text-gray-700">City</label>
              <input v-model="newSport.city" type="text" id="city" class="mt-1 p-2 border border-gray-300 rounded-lg w-full focus:outline-none focus:border-purple-500" required />
            </div>
            <div class="flex justify-end">
              <button type="button" @click="cancelAdd" class="text-gray-500 hover:text-gray-700 mr-4">Cancel</button>
              <button type="submit" class="bg-purple-600 text-white py-2 px-4 rounded-lg hover:bg-purple-700">Add</button>
            </div>
          </form>
        </div>
      </div>
    </transition>

    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
      <div v-for="sport in sports.data._value" :key="sport.id" class="bg-white shadow-md rounded-lg overflow-hidden transition duration-300 ease-in-out transform hover:scale-105">
        <NuxtLink :to="'/modifiable/mod_sport/' + sport.id">
          <div class="p-4">
            <h1 class="text-2xl font-bold mb-2 text-purple-800">{{ sport.name }}</h1>
            <p class="text-gray-700">{{ sport.city }}</p>
          </div>
        </NuxtLink>
        <div class="px-4 py-2 bg-purple-200 border-t border-purple-300 flex justify-end">
          <button @click="confirmDeleteSport(sport.id, sport.name, sport.city)" class="text-red-500 font-semibold hover:text-red-700 focus:outline-none">Delete</button>
        </div>
      </div>
    </div>
    <div class="pt-8"><ChangePass></ChangePass></div>
    

    <!-- Confirmation Dialog -->
    <transition name="fade">
      <div v-if="showConfirmDialog" class="fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-50">
        <div class="bg-white p-8 rounded-lg shadow-md max-w-md">
          <h2 class="text-xl font-semibold mb-4">Confirm Delete</h2>
          <p class="mb-4">{{ confirmMessage }}</p>
          <div class="flex justify-end">
            <button @click="cancelDelete" class="text-gray-500 hover:text-gray-700 mr-4">Cancel</button>
            <button @click="deleteSport" class="bg-red-600 text-white py-2 px-4 rounded-lg hover:bg-red-700">Confirm</button>
          </div>
        </div>
      </div>
    </transition>
  </div>
</template>

<script setup>
// import { useFetch } from '@nuxtjs/composition-api';
import { ref } from 'vue';
import ChangePass from '~/components/ChangePass.vue';

definePageMeta({ middleware: 'verify' })


const {data} = useAuth()
const user = data._object['$sauth:data'].user
if (user.role !== 'president') {
  navigateTo('/')
}

const sports = await useFetch('/api/sport/all_sport');
const showConfirmDialog = ref(false);
const showAddForm = ref(false);
const sportToDelete = ref(null);
const confirmMessage = ref('');

const newSport = ref({
  name: '',
  city: '',
});

const confirmDeleteSport = (sportId, name, city) => {
  confirmMessage.value = `Are you sure you want to delete sport ${name} from ${city}?`;
  sportToDelete.value = sportId;
  showConfirmDialog.value = true;
};

const cancelDelete = () => {
  showConfirmDialog.value = false;
};

const deleteSport = async () => {
    console.log(sportToDelete.value);
    const { data, error } = await useFetch(`/api/protected_action/delete_sport`, {
      method: 'POST',
      body: {
        sport_id: sportToDelete.value,
      },
    });
    showConfirmDialog.value = false;
    window.location.reload();
  };

const cancelAdd = () => {
  showAddForm.value = false;
};

const addSport = async () => {
    const {data,error} = await useFetch(`/api/protected_action/add_sport`, {
      method: 'POST',
      body: {
        name: newSport.value.name,
        city: newSport.value.city,
    },
    });
    window.location.reload();
};
</script>

<style scoped>
.hover\:scale-105:hover {
  transform: scale(1.05);
}

.fade-enter-active, .fade-leave-active {
  transition: opacity 0.3s;
}
.fade-enter, .fade-leave-to {
  opacity: 0;
}
</style>
