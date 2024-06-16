<script setup lang="ts">
// import { ContentDoc } from '#build/components';
</script>

<template>
    <div class="h-screen">
        <Navbar/>
        <div class="flex flex-col items-center justify-center">
            <h1 class="text-4xl font-bold">All Sports</h1>
            <div class="grid grid-cols-3 gap-4">
                <div v-for="sport in sports" :key="sport.id" class="bg-gray-100 p-4 rounded-lg">
                    <h2 class="text-xl font-bold">{{ sport.name }}</h2>
                    <p>{{ sport.description }}</p>
                </div>
            </div>
        </div>
        <div><ContentDoc path="/actualite/actu1"/></div>
    </div>
</template>
