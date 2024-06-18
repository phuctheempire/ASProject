<template>
    <div>
        <!-- <NuxtLayout> -->
        <!-- <NuxtPage /> -->
        <!-- </NuxtLayout> -->
        <!-- <Navbar /> -->
        <h1 class="text-3xl font-bold">Hi! I'm protected.</h1>
        <!-- <h1>Data{{ data }}</h1> -->
         <h1>{{ donnee }}</h1>
    </div>
</template>

<script setup lang="ts">
// const {status, data} = useAuth()
definePageMeta({ middleware: 'verify' })

const {donnee} = await useFetch('/api/a')
</script>
<!-- <script setup lang="ts">
    
</script> -->