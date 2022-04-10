<script>
import axios from 'axios'
export default {
  data: function () {
    return {
      message: "Welcome to Fruits!",
      fruits: []
    };
  },
  created: function () {
    this.indexFruits();
  },
  methods: {
    indexFruits: function () {
      axios.get("/fruits").then(response => {
        console.log(response.data);
        this.fruits = response.data
      })
    }
  },
};
</script>

<template>
  <div class="home">
    <h1>{{ message }}</h1>
    <div v-for="fruit in fruits" v-bind:key="fruit">
      <p>{{ fruit.name }}</p>
    </div>
  </div>
</template>

<style>
</style>