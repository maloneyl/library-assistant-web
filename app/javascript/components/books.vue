<template>
  <section class="books">
    <div class="description">
      <p>
        <span class="emoji">💁🏻‍♀️💁🏽‍♂️</span>
        We've found <strong>{{ this.bookCount }}</strong> of your recently added to-read books.
      </p>
    </div>
    <div class="sort-controls">
      <button @click="this.sortByRatingDesc">Highest rated first</button>
      <button @click="this.sortByYearDesc">Most recently published first</button>
    </div>
    <div class="book-list">
      <book :book="book" :index=index v-for="(book, index) in books" :key="book.isbn" />
    </div>
  </section>
</template>

<script>
  import Book from './book.vue';

  export default {
    props: {
      books: {
        type: Array,
        default: () => []
      }
    },
    components: { Book },
    computed: {
      bookCount () {
        return this.books.length
      }
    },
    methods: {
      sortByRatingDesc() {
        return this.books.sort((a, b) => b.average_rating - a.average_rating)
      },
      sortByYearDesc() {
        return this.books.sort((a, b) => b.year - a.year)
      }
    }
  }
</script>

<style lang="scss" scoped>
  .books {
    max-width: 90vw;
    margin: 2em auto;
    font-family: 'Lato', sans-serif;

    .description {
      font-size: 1.2em;

      .emoji {
        display: block;
      }
    }

    .sort-controls {
      margin-bottom: 1.5em;

      button {
        font-family: 'Lato', sans-serif;
        font-size: 0.9em;
        margin: 5px;
      }
    }

    .book-list {
      display: flex;
      flex-direction: column;
      align-items: center;
    }
  }

  @media only screen and (min-width: 650px) {
    .books {
      max-width: 960px;

      .description .emoji {
        display: inline;
      }

      .book-list {
        flex-direction: row;
        flex-wrap: wrap;
        justify-content: center;
      }
    }
  }
</style>
