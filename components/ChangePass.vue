<script setup>


import { ref, onMounted } from 'vue';
definePageMeta({ middleware: 'verify' })


const {data} = useAuth()
const user = data._object['$sauth:data'].user
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
  const {data, error} = useFetch(`/api/protected_action/change_pass`,{
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
</script>

<template>

<section class="mb-12">
      <h2 class="text-2xl font-semibold mb-4">Informations sur le compte</h2>
      <div class="bg-white shadow-lg rounded-lg p-6 mb-6">
        <div v-if="stat">
          <div :class="stat === 'success' ? 'bg-green-100 border-green-400 text-green-700' : 'bg-red-100 border-red-400 text-red-700'" class="border rounded p-4 mb-4" role="alert">
            <p>{{ mess }}</p>
          </div>
        </div>
        <form class="space-y-4"
          @submit.prevent="change_password"
        >
          <div>
            <label class="block text-gray-700 text-sm font-bold mb-2" for="old-pass">
              Ancien mot de passe
            </label>
            <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="old-pass" type="password" v-model="old_pass" placeholder="Entrez l'ancien mot de passe">
          </div>
          <div>
            <label class="block text-gray-700 text-sm font-bold mb-2" for="new-pass">
              Nouveau mot de passe
            </label>
            <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="new-pass" type="password" v-model="new_pass" placeholder="Entrez le nouveau mot de passe">
          </div>
          <div>
            <label class="block text-gray-700 text-sm font-bold mb-2" for="confirm-pass">
              Confirmer le mot de passe
            </label>
            <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="confirm-pass" type="password" v-model="confirm_pass" placeholder="Confirmez le mot de passe">
          </div>
          <button type="submit" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">Enregistrer</button>
        </form>
        <ModInfo></ModInfo>
      </div>
    </section>
</template>