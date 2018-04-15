<template>
  <div id="app">
    <header>
      <h1>🤓📚</h1>
    </header>

    <main>
      <template v-if="this.loading || this.hasErrors">
        <loader v-if="this.loading" />
        <div v-if="this.hasErrors"><p>😳😅</p></div>
      </template>
      <template v-else>
        <books v-if="this.hasBooks" :books="books" />
        <div v-else><p>There are no books. 😞</p></div>
      </template>
    </main>

    <footer>
      <p>
        &ldquo;{{ this.quote.body }}&rdquo; &mdash; {{ this.quote.author }}
      </p>
    </footer>
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
        errors: [],
        quote: {
          body: 'I wish you way more than luck.',
          author: 'David Foster Wallace'
        }
      }
    },
    created() {
      this.fetchData();
    },
    computed: {
      hasErrors() {
        return this.errors.length > 0
      },
      hasBooks() {
        return this.books.length > 0
      }
    },
    methods: {
      fetchData() {
        this.loading = true;

        axios.get('/books')
          .then(({data}) => this.books = data)
          .catch(error => this.errors.push(error))
          .then(() => this.loading = false)
      }
    }
  }
</script>

<style lang="scss" scoped>
  #app {
    min-height: 100vh;
    display: flex;
    flex-direction: column;
  }

  header {
    background: hsl(0, 0%, 10%);
    padding: 0.5em;
    margin-bottom: 0.5em;

    h1 {
      margin: 0;
    }
  }

  main {
    flex: 1;
    text-align: center;
  }

  footer {
    background: hsl(0, 0%, 20%);
    color: hsl(360, 100%, 100%);
    padding: 1em;
    text-align: center;
    font-size: 0.7em;
    font-weight: 300;
    font-style: italic;
    margin-top: 0.5em;
  }
</style>
