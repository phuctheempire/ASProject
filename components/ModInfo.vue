<script setup>
import { ref } from 'vue';

const user = await useFetch('/api/protected_action/me')
const valUser = user.data._value
console.log(valUser)

const info = ref({ username:valUser.username, name: valUser.name, email: valUser.email, image:valUser.image });
const showModal = ref(false);

const change_info = async () => {
  const { data, error } = await useFetch(`/api/protected_action/mod_info`, {
    method: "POST",
    body: {
      id: valUser.id,
      username: info.value.username,
      name: info.value.name,
      email: info.value.email,
        image: info.value.image
    }
  });
    window.location.reload();
};
</script>

<template>
    <div class="page-container">
      <button @click="showModal = true" class="blue-button">Modifier Infos</button>
      
      <Teleport to="body">
        <div v-if="showModal" class="fixed inset-0 bg-gray-900 bg-opacity-50 flex justify-center items-center z-50">
          <div class="bg-white rounded-lg p-6 w-96 shadow-lg">
            <h2 class="text-xl font-semibold text-purple-700 mb-4">Modifier vos informations</h2>

            <label class="block mb-2">
              <span class="text-gray-700">Username:</span>
              <input v-model="info.username" type="text" class="mt-1 block w-full p-2 border border-gray-300 rounded-md">
            </label>
            
            <label class="block mb-2">
              <span class="text-gray-700">Nom:</span>
              <input v-model="info.name" type="text" class="mt-1 block w-full p-2 border border-gray-300 rounded-md">
            </label>
            
            <label class="block mb-4">
              <span class="text-gray-700">Email:</span>
              <input v-model="info.email" type="email" class="mt-1 block w-full p-2 border border-gray-300 rounded-md">
            </label>

            <label class="block mb-4">
              <span class="text-gray-700">Image:</span>
              <input v-model="info.image" type="text" class="mt-1 block w-full p-2 border border-gray-300 rounded-md">
            </label>


            
            <div class="flex justify-end space-x-2">
              <button @click="showModal = false" class="small-button cancel-button">Annuler</button>
              <button @click="change_info" class="small-button save-button">Enregistrer</button>
            </div>
          </div>
        </div>
      </Teleport>
    </div>
  </template>
  
  

  <style scoped>
  .page-container {
      display: flex;
      flex-direction: column;
      align-items: center;
      margin: 20px;
  }
  
  .button-container {
      display: flex;
      justify-content: center;
      margin-bottom: 20px;
  }
  
  .blue-button {
      background-color: #007BFF; /* Blue color */
      color: white;
      border: none;
      border-radius: 5px;
      padding: 10px 20px; /* Smaller size */
      margin: 0 10px;
      cursor: pointer;
      transition: background-color 0.3s;
      font-size: 1em;
      height: 40px; /* Smaller width */
      
  }
  
  .blue-button:hover {
      background-color: #0056b3; /* Darker blue on hover */
  }
  
  .content-rectangle {
      background: linear-gradient(135deg, #E1BEE7 0%, #EDE7F6 50%, #D1C4E9 100%);
      color: #4A0072;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      max-width: 1200px;
      width: 100%;
      margin-bottom: 20px;
  }
  
  .content-section {
      font-size: 1em;
  }
  
  .content-section p {
      margin-bottom: 10px;
  }
  
  .content-section ul {
      list-style-type: disc;
      padding-left: 20px;
      margin-bottom: 10px;
  }
  
  .editable-field {
      font-size: 1.2em;
      margin-bottom: 20px;
  }
  
  .editable-input,
  .editable-textarea {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      margin-top: 5px;
  }
  
  .editable-input:focus,
  .editable-textarea:focus {
      border-color: #6A0DAD;
      outline: none;
  }
  
  .editable-textarea {
      min-height: 60px;
      resize: vertical;
  }
  
  .horraire-entry {
      display: flex;
      gap: 10px;
      margin-top: 10px;
  }
  
  .horraire-entry .editable-input {
      flex: 1;
  }
  
  .responsable-container {
      display: flex;
      justify-content: space-around;
      gap: 20px;
      margin-top: 20px;
  }
  
  .responsable {
      display: flex;
      flex-direction: column;
      align-items: center;
      text-align: center;
  }
  
  .responsable-photo {
      border-radius: 50%;
      width: 150px;
      height: 150px;
      object-fit: cover;
  }
  
  .responsable-card {
      background: linear-gradient(135deg, #E1BEE7 0%, #EDE7F6 50%, #D1C4E9 100%);
      color: #4A0072;
      padding: 15px;
      border-radius: 10px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      margin-top: 10px;
      width: 100%;
  }
  
  .responsable-card h3 {
      margin: 0;
  }
  
  .responsable-card p {
      margin: 5px 0 0;
  }
  
  .article-title,
  .event-title {
      font-size: 0.7em;
      font-weight: bold;
      color: #4A0072;
      margin-bottom: 5px;
  }
  
  .article-description,
  .event-description {
      font-size: 0.6em;
      color: #4A0072;
      margin-top: 0;
  }
  
  .small-button {
      padding: 8px 16px; /* Smaller size */
      font-size: 0.9em; /* Smaller font size */
      border-radius: 5px;
      cursor: pointer;
  }
  
  .cancel-button {
      background-color: #ccc;
  }
  
  .save-button {
      background-color: #007BFF;
      color: white;
  }
  
  /* Responsive design adjustments */
  @media (max-width: 768px) {
      .content-rectangle {
          max-width: 95%;
      }
  }
  </style>
  
  
