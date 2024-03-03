
const truncateAttractionDescription = () => {
  const descriptions = document.querySelectorAll('.attractions .description')
  if(!descriptions) return

  const maxLength = 150

  descriptions.forEach(content => {
    if(content.innerHTML.length > maxLength) {
      content.innerHTML = content.innerHTML.substring(0, maxLength) + '...'
    }
  })
}

document.addEventListener('DOMContentLoaded', () => {
  truncateAttractionDescription()
})