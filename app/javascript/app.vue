<template>
  <div id="app">
    <div class="container">
      <header>🤓📚</header>

      <main>
        <div class="loader" v-if="this.loading"><loader /></div>
        <template v-else>
          <div class="errors" v-if="this.hasErrors">😳😅</div>
          <books v-else :books="books" />
        </template>
      </main>

      <footer>
        &ldquo;{{ this.quote.body }}&rdquo; &mdash; {{ this.quote.author }}
      </footer>
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
    margin: 0 auto;
  }

  .container {
    min-height: 100vh;
    display: grid;
    grid-template-columns: 100%;
    grid-template-rows: auto 1fr auto;
    grid-template-areas:
      "header"
      "main"
      "footer";
    justify-items: center;
    align-items: stretch;

    .loader, .errors {
      padding-top: 15vh;
    }
  }

  header {
    grid-area: header;
    width: 100%;
    background: hsl(0, 0%, 10%);
    padding: 0.3em;
    font-size: 1.5em;
  }

  main {
    grid-area: main;
    max-width: 1000px;
  }

  footer {
    grid-area: footer;
    width: 100%;
    background: hsl(0, 0%, 20%);
    color: hsl(360, 100%, 100%);
    padding: 1em;
    text-align: center;
    font-size: 0.7em;
    font-weight: 300;
    font-style: italic;
  }
</style>
