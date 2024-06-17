
<template>
  <div class="login-container">
    <h1>Connexion</h1>
    <form @submit.prevent="login">
      <input type="text" v-model="username" placeholder="Nom d'utilisateur" required>
      <input type="password" v-model="password" placeholder="Mot de passe" required>
      <button type="submit">Se connecter</button>
    </form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      username: '',
      password: ''
    };
  },
  methods: {
    login() {
      // Logique de connexion ici
      alert(`Connexion avec ${this.username}`);
      // Redirect after login
      this.$router.push('/viceprez');
    }
  }
}
</script>

<style scoped>
.login-container {
  max-width: 300px;
  margin: 100px auto;
  padding: 20px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  border-radius: 8px;
  background: white;
  display: flex;
  flex-direction: column;
}

.login-container h1 {
  text-align: center;
  color: #333;
  margin-bottom: 20px;
}

input[type="text"],
input[type="password"] {
  padding: 10px;
  margin-bottom: 15px;
  border: 1px solid #ccc;
  border-radius: 4px;
  width: 100%; /* Ensure it fills the container */
  box-sizing: border-box; /* Includes padding and border in width */
}

button {
  background-color: #4B0082; /* Deep purple */
  color: white;
  padding: 10px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

button:hover {
  background-color: #662E9B;
}

</style>


