<template>
    <div>
        <!-- <NuxtLayout> -->
        <!-- <NuxtPage /> -->
        <!-- </NuxtLayout> -->
        <!-- <Navbar /> -->
        <h1 class="text-3xl font-bold">Hi! I'm protected.</h1>
        <!-- <h1>Data{{ data }}</h1> -->
         <h1>{{ data }}</h1>
         <p>{{ sport }}</p>
    </div>
</template>

<script setup lang="ts">
// const {status, data} = useAuth()
definePageMeta({ middleware: 'verify' })

const {data} = await useFetch('/api/a')
const sport = await useFetch('/api/content/sport')
</script>
<!-- <script setup lang="ts">
    
</script> -->