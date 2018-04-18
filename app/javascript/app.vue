<template>
  <div id="app" class="site">
    <header>
      <h1>GxIL</h1>
    </header>

    <section class="menu" :class="{ reveal: showNav }">
      <button class="trigger" @click="toggleNav">Menu</button>

      <main-nav />
    </section>

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
      <div class="rule">
        <div class="before"></div>
        <div class="text">fin.</div>
        <div class="after"></div>
      </div>
      <p class="quote">
        &ldquo;{{ this.quote.body }}&rdquo;
        <span class="author">&mdash; {{ this.quote.author }}</span>
      </p>
    </footer>
  </div>
</template>

<script>
  import Loader from './components/loader.vue';
  import MainNav from './components/main-nav.vue';
  import Books from './components/books.vue';
  import axios from 'axios';

  export default {
    components: { Books, Loader, MainNav },
    data() {
      return {
        loading: false,
        books: [],
        errors: [],
        quote: {
          body: 'I wish you way more than luck.',
          author: 'David Foster Wallace'
        },
        showNav: false
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
      },
      toggleNav() {
        this.showNav = !this.showNav
      }
    }
  }
</script>

<style lang="scss" scoped>
  .site {
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    background: hsl(0, 0%, 95%);
    font-family: 'Merriweather', serif;
  }

  header {
    font-family: 'Pacifico', cursive;
    padding: 1em;
    margin-bottom: 0.5em;
    border-bottom: 1px solid hsl(0, 0%, 80%);
    text-align: center;

    h1 {
      margin: 0;
    }
  }

  main {
    flex: 1;
    text-align: center;
  }

  .menu {
    display: none;
  }

  footer {
    color: hsl(0, 0%, 40%);
    padding: 1em;
    text-align: center;
    font-style: italic;
    margin-top: 0.5em;

    .rule {
      display: flex;
      justify-content: center;
      margin-bottom: 1.5em;

      .text {
        font-family: 'Pacifico', cursive;
        font-size: 1.5em;
        margin: 0 5px;
      }

      .before, .after {
        position: relative;
        top: 0.75em;
        width: 15%;
        min-width: 100px;
        border-top: 1px solid hsl(0, 0%, 70%);
      }
    }

    .quote {
      font-size: 0.7em;
      margin-top: 1em;

      .author {
        display: block;
      }
    }
  }

  @media only screen and (min-width: 650px) {
    footer .quote .author {
      display: inline;
    }
  }

  @supports (grid-area: auto) {
    @media only screen and (min-width: 60em) {
      .site {
        display: grid;
        grid-template-areas:
          "header header header"
          "main main main"
          "footer footer footer"
      }

      header {
        grid-area: header;
        margin-bottom: 0;
      }

      main {
        grid-area: main;
      }

      .menu, .trigger {
        background: hsl(0, 0%, 10%);
        color: #fff;
        font-family: 'Lato', serif;
      }

      .menu {
        display: block;
        position: relative;
        grid-column: 1;
        grid-row: 1 / 4;
        width: 15em;
        left: -13em;
        font-size: 0.8em;
        padding-top: 1em;

        .trigger {
          font-size: 0.6em;
          transform: rotate(90deg);
          border: none;
          padding: 0.5em;
          font-size: 1em;
          position: fixed;
          top: 1.5em;
          left: 1em;
        }

        &.reveal {
          left: 0;

          .trigger {
            left: 14em;
          }

          .main-nav {
            position: fixed;
          }
        }
      }

      footer {
        grid-area: footer;
        margin-top: 0;
      }
    }
  }
</style>
