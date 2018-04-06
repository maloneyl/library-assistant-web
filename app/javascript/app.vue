<template>
  <div id="app">
    <header>
      <h1>🤓📚</h1>
    </header>

    <div class="container">
      <loader v-if="this.loading" />
      <books v-else :books="books" />
      <div class="errors" v-if="this.errors.length > 0">
        😳😅
      </div>
    </div>
  </div>
</template>

<script>
  import Loader from './components/loader.vue';
  import Books from './components/books.vue';
  import axios from 'axios';

  export default {
    components: { Books, Loader },
    data() {
      return {
        loading: false,
        books: [],
        errors: []
      }
    },
    created() {
      this.fetchData();
    },
    methods: {
      fetchData() {
        this.loading = true;

        axios.get('/books')
          .then(({data}) => this.books = data)
          .catch(error => this.errors.push = error)
          .then(() => this.loading = false)
      }
    }
  }
</script>

<style lang="scss" scoped>
  #app {
    margin: 0 auto;
  }

  header {
    background: hsl(0, 0%, 10%);
    padding: 0.5em;
    text-align: center;

    h1 {
      margin: 0;
      font-size: 3em;
    }
  }

  .container {
    max-width: 1200px;
    margin: 0 auto;
    text-align: center;

    .loader, .errors {
      margin-top: 20vh;
    }
  }
</style>
