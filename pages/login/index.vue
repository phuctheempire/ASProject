<script setup lang="ts">

// const { status, signIn, signOut } = useAuth()

// const loggedIn = computed(() => status.value === 'authenticated')

// async function handleSignIn() {
//   await signIn()
// }

// async function handleSignOut() {
//   await signOut()
// }
definePageMeta({
  // auth:{
  //     unauthentiacatedOnly: true,
  //     navigateAuthenticatedTo: '/',
  // },
  middleware: 'authen',
})
</script>

<template>
  <Login />
</template>