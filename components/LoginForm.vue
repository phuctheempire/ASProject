<template>
  <form class="space-y-4 md:space-y-6" @submit.prevent="handleSubmit">
    <div>
      <label for="username" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
        Nom d'utilisateur
      </label>
      <input
        v-model="username"
        type="text"
        name="username"
        id="username"
        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
        placeholder="username"
        required
      />
    </div>
    <div>
      <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
        Mot de passe
      </label>
      <input
        v-model="password"
        type="password"
        name="password"
        id="password"
        placeholder="••••••••"
        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
        required
      />
      <!-- Wrong Password Message -->
      <p v-if="wrongPassword" class="mt-2 text-sm text-red-600 dark:text-red-400">
        Mot de passe incorrect
      </p>
    </div>
    <div class="flex items-center justify-between">
      <div class="flex items-start">
        <div class="flex items-center h-5">
          <input
            id="remember"
            aria-describedby="remember"
            type="checkbox"
            class="w-4 h-4 border border-gray-300 rounded bg-gray-50 focus:ring-3 focus:ring-primary-300 dark:bg-gray-700 dark:border-gray-600 dark:focus:ring-primary-600 dark:ring-offset-gray-800"
            required
          />
        </div>
        <div class="ml-3 text-sm">
          <label for="remember" class="text-gray-500 dark:text-gray-300">
            Souvenez-vous de moi
          </label>
        </div>
      </div>
    </div>
    <button
      type="submit"
      class="w-full text-black bg-primary-600 hover:bg-primary-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800"
    >
      Se connecter
    </button>
  </form>
</template>

<script setup lang="ts">
const { data, signIn } = useAuth()

const username = ref('')
const password = ref('')
const wrongPassword = ref(false)

const handleSubmit = async () => {
  try {
    wrongPassword.value = false
    await signIn('credentials', { username: username.value, password: password.value })
    // Handle successful sign-in
  } catch (error) {
    wrongPassword.value = true
  }
}
</script>
