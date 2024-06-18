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

// import { PrismaClient } from '@prisma/client'
// const prisma = new PrismaClient()
// const sport = await prisma.sport.findMany()

// const {status, data} = useAuth()
const data = await useFetch('/api/a')
definePageMeta({ middleware: 'verify' })
// ----------------------------------
const sport = await useFetch('/api/content/sport')

// ----------------------------------
</script>
<!-- <script setup lang="ts">
    
</script> -->