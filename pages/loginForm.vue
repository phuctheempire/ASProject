<template>
  <div v-if="visible" class="fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center">
    <div class="bg-white p-8 rounded-lg">
      <h2 class="text-xl font-bold mb-6">Connexion</h2>
      <form @submit.prevent="login">
        <div class="mb-4">
          <label for="username" class="block text-sm font-medium text-gray-700">Nom d'utilisateur</label>
          <input type="text" id="username" v-model="username" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
        </div>
        <div class="mb-6">
          <label for="password" class="block text-sm font-medium text-gray-700">Mot de passe</label>
          <input type="password" id="password" v-model="password" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
        </div>
        <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">Se connecter</button>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      visible: false,
      username: '',
      password: ''
    };
  },
  methods: {
    login() {
      // Implémentez votre logique de connexion ici
      alert(`Connexion de l'utilisateur ${this.username} avec le mot de passe ${this.password}`);
      this.visible = false; // Fermer le modal après la connexion
    },
    open() {
      this.visible = true;
    }
  }
}
</script>
