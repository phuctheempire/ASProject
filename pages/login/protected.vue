<template>
    <div>
        <!-- <NuxtLayout> -->
        <!-- <NuxtPage /> -->
        <!-- </NuxtLayout> -->
        <!-- <Navbar /> -->
        <h1 class="text-3xl font-bold">Hi! I'm protected.</h1>
        <!-- <h1>Data{{ data }}</h1> -->
         <!-- <h1>{{ data }}</h1> -->
         <!-- <p>{{ sport }}</p>
            <p>{{ article }}</p>
            <p>{{ evenement }}</p>
            <p>{{ person }}</p> -->
            <p>{{ user }}</p>
            
    </div>
</template>

<script setup lang="ts">

// import { PrismaClient } from '@prisma/client'
// const prisma = new PrismaClient()
// const sport = await prisma.sport.findMany()

// const {status, data} = useAuth()
const data = await useFetch('/api/a')
// definePageMeta({ middleware: 'verify' })
// ----------------------------------
const sport = await useFetch('/api/content/sport')
const article = await useFetch('/api/content/article')
const evenement = await useFetch('/api/content/evenement')
const person = await useFetch('/api/content/person')
const user = await useFetch('/api/content/users')

// ----------------------------------
</script>
<!-- <script setup lang="ts">
    
</script> -->