<template>
  <div>
    <nav>
      <ul>
        <li><nuxt-link to="/badminton">Badminton</nuxt-link></li>
        <li><nuxt-link to="/basket">Basket</nuxt-link></li>
        <li><nuxt-link to="/cheer">Cheerleading</nuxt-link></li>
        <li><nuxt-link to="/foot">Football</nuxt-link></li>
        <li><nuxt-link to="/handball">Handball</nuxt-link></li>
        <li><nuxt-link to="/natation">Natation</nuxt-link></li>
        <li><nuxt-link to="/rugby">Rugby</nuxt-link></li>
        <li><nuxt-link to="/tennis">Tennis</nuxt-link></li>
        <li><nuxt-link to="/ultimate">Ultimate</nuxt-link></li>
        <li><nuxt-link to="/volley">Volley</nuxt-link></li>
      </ul>
    </nav>
  </div>
  <h1>Bienvenue sur le site de l'Association Sportive</h1>
</template>

<script>
export default {
  name: 'HomePage'
}
</script>

<style scoped>
nav ul {
  list-style-type: none;
  padding: 0;
}
nav li {
  display: inline;
  margin-right: 15px;
}
</style>
