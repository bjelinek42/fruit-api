<script>
import axios from 'axios'
export default {
  data: function () {
    return {
      message: "Welcome to Fruits!",
      fruits: [],
      newFruitParams: {},
      currentFruit: {}
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
    },
    createFruit: function () {
      axios.post("/fruits", this.newFruitParams).then(response => {
        console.log("creating fruit", response.data)
        this.fruits.push(response.data)
      })
    },
    showFruit: function (fruit) {
      this.currentFruit = fruit
      document.querySelector("#fruit-info").showModal()
    }
  },
};
</script>

<template>
  <div class="home">
    <h1>{{ message }}</h1>
    <p>Create New Friuit</p>
    <p>Name: <input type="text" v-model="newFruitParams.name"></p>
    <p>Color: <input type="text" v-model="newFruitParams.color"></p>
    <p>Price: <input type="text" v-model="newFruitParams.price"></p>
    <button @click="createFruit()">Create!</button>
    <div v-for="fruit in fruits" v-bind:key="fruit">
      <p>{{ fruit.name }}</p>
      <button @click="showFruit(fruit)">More Info</button>
      <dialog id="fruit-info">
        <form method="dialog">
          <p>Name: {{ currentFruit.name }}</p>
          <p>Color: {{ currentFruit.color }}</p>
          <p>Price: {{ currentFruit.price }}</p>
          <button>Close</button>
        </form>
      </dialog>
    </div>
  </div>
</template>

<style>
</style>