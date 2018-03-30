<template>
  <div id="app">
    <h1>🤓📚</h1>

    <div class="loading" v-if="this.loading">Loading...</div>
    <div class="books" v-else>
      <book :bookObj="book" v-for="book in books" />
    </div>
  </div>
</template>

<script>
  import axios from 'axios';
  import Book from './components/book.vue';

  export default {
    components: {
      Book
    },
    data() {
      return {
        loading: false,
        books: []
      }
    },
    created() {
      this.fetchData();
    },
    methods: {
      fetchData() {
        this.loading = true;
        axios.get('/books')
        .then(({data}) => {
          this.books = data;
          this.loading = false;
         })
        .catch(error => console.log(error))
      }
    }
  }
</script>

<style lang="scss" scoped>
  #app {
    padding: 2em 2em;
    max-width: 1200px;
    margin: 0 auto;
  }

  h1, .loading {
    width: 100%;
    text-align: center;
  }

  .books {
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
    flex: 0 0 auto;
  }
</style>
