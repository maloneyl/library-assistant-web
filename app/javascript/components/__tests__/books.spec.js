import { shallow } from '@vue/test-utils'
import Books from '@/components/books.vue'

describe('Books', () => {
  it('renders the no-books message when not given props', () => {
    const wrapper = shallow(Books)
    expect(wrapper.find('.no-books').exists()).toBeTruthy()
    expect(wrapper.text()).toBe("There are no books. 😞")
  })

  it('renders the no-books message when there are no books in props', () => {
    const wrapper = shallow(Books, {
      propsData: { books: [] }
    })
    expect(wrapper.text()).toBe("There are no books. 😞")
  })
})
