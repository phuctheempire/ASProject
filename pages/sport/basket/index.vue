<template>
    <div class="h-screen">
        <Navbar/>
        <div class="flex flex-col items-center justify-center">
            <h1 class="text-4xl font-bold">Basketball</h1>
            <div class="grid grid-cols-3 gap-4">
                <!-- <div v-for="sport in sports" :key="sport.id" class="bg-gray-100 p-4 rounded-lg">
                    <h2 class="text-xl font-bold">{{ sport.name }}</h2>
                    <p>{{ sport.description }}</p>
                </div> -->
                <!-- <div><ContentDoc path="/actualite/actu1"/></div> -->
                
                <div v-for="d in data " :key="home">
                    <h1>{{ d.title }}</h1>
                    <p>{{ d.description }}</p>
                    <p>{{ d.content }}</p>  
                    <p>{{ d.structure }}</p>  
                    <div v-for="(item,index) in d.list" :key="index">
                        <div v-for="(field, subIndex) in item" :key="subIndex">
                            <p>{{ field }}</p>
                        </div>
                    </div>
                    <h1><ContentRenderer :value="d"></ContentRenderer></h1>
                </div>
            </div>
        </div>
    </div>
    
</template>
<!-- <script>
    // let sport = $content('/actualite/actu1')
    // console.log(sport)

    
</script> -->

<script setup>
// import { ContentRenderer, ContentSlot } from '#build/components';

const { data } = await useAsyncData('home', () => queryContent('actualite').find())
console.log(data)
console.log("hello")
</script>
