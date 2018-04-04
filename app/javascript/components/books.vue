<template>
  <section class="books">
    <book :bookObj="book" v-for="book in books" />
    <div class="no-books" v-if="this.books.length === 0">
      There are no books. 😞
    </div>
  </section>
</template>

<script>
  import Book from './book.vue';

  export default {
    props: {
      books: { type: Array }
    },
    components: { Book }
  }
</script>

<style lang="scss" scoped>
  .books {
    margin-top: 3em;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: stretch;

    .no-books {
      margin-top: 20vh;
    }
  }
</style>
