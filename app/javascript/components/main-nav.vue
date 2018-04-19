<template>
  <nav class="main-nav">
    <ul>
      <li v-for="link in links">
        <a :href="link.href">{{ link.name }}</a>
      </li>
    </ul>
  </nav>
</template>

<script>
  export default {
    data () {
      return {
        links: [
          { name: 'Goodreads', href: 'https://www.goodreads.com' },
          { name: 'Islington Library', href: 'http://capitadiscovery.co.uk/islington/account' },
          { name: 'Future Page', href: '#' },
          { name: 'One More Thing', href: '#' },
        ]
      }
    }
  }
</script>

<style lang="scss" scoped>
  ul {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    text-align: left;
    padding-left: 30px;
  }

  li {
    display: inline;
    margin: 10px 0;
    font-size: 1em;
  }

  a {
    text-decoration: none;
    color: #fff;

    &:hover {
      color: hsla(209, 100%, 50%, 1);
    };
  }
</style>
