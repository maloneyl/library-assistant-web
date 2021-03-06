import { shallow } from '@vue/test-utils'
import Books from '@/components/books.vue'

describe('Books', () => {
  describe('sorting methods', () => {
    const books = [
      {title: 'A', average_rating: '4.12', year: '2008'},
      {title: 'B', average_rating: '3.40', year: '2018'},
      {title: 'C', average_rating: '4.51', year: '2005'},
      {title: 'D', average_rating: '4.23', year: '1999'}
    ]

    const wrapper = shallow(Books, {
      propsData: { books: books }
    })

    describe('sortByRatingDesc', () => {
      it('sorts by highest rating first', () => {
        expect(wrapper.vm.sortByRatingDesc()).toEqual(
          [
            {title: 'C', average_rating: '4.51', year: '2005'},
            {title: 'D', average_rating: '4.23', year: '1999'},
            {title: 'A', average_rating: '4.12', year: '2008'},
            {title: 'B', average_rating: '3.40', year: '2018'}
          ]
        )
      })
    })

    describe('sortByYearDesc', () => {
      it('sorts by latest year first', () => {
        expect(wrapper.vm.sortByYearDesc()).toEqual(
          [
            {title: 'B', average_rating: '3.40', year: '2018'},
            {title: 'A', average_rating: '4.12', year: '2008'},
            {title: 'C', average_rating: '4.51', year: '2005'},
            {title: 'D', average_rating: '4.23', year: '1999'}
          ]
        )
      })
    })
  })
})
