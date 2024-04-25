// Function to truncate attraction descriptions
const truncateAttractionDescription = () => {
    const descriptions = document.querySelectorAll('.attractions .description')
    if (!descriptions) return

    const maxLength = 150

    descriptions.forEach(content => {
        if (content.innerHTML.length > maxLength) {
            content.innerHTML = content.innerHTML.substring(0, maxLength) + '...'
        }
    })
}

/**
 * Initializes the attraction filters component.
 * This function returns an object representing the state and methods for managing attraction filters.
 * @returns {Object} An object containing the state and methods for managing attraction filters.
 */
const attractionFilters = () => {
    const maxWidth = 1200
    return {
        showFilters: false,

        initFilters() {
            this.updateShowFilters()

            window.addEventListener('resize', () => {
                setTimeout(() => {
                    this.updateShowFilters()
                }, 200)
            })
        },

        updateShowFilters() {
            this.showFilters = window.innerWidth > maxWidth
        }
    }
}

// Function to update checkboxes based on the number of available attractions
const disableCheckboxes = () => {
    const attractionsContainer = document.getElementById('filtered-results')
    if (!attractionsContainer) return
    const numAttractions = attractionsContainer.querySelectorAll('.attraction').length
    const checkboxes = document.querySelectorAll('.filter input[type="checkbox"]')
    if (numAttractions === 1) {
        checkboxes.forEach(checkbox => {
            if (!checkbox.checked) {
                checkbox.disabled = true
            }
        })
    }
}

// Function to filter attractions based on categories
const filterAttractions = () => {
    const checkboxes = document.querySelectorAll('.filter input[type="checkbox"]')
    if (!checkboxes) return

    const searchInput = document.getElementById('search_text')
    const searchText = searchInput ? searchInput.value.trim() : '';
    let filterPriority = []
    checkboxes.forEach(checkbox => {
        checkbox.addEventListener('change', () => {
            const selectedCategories = []
            const selectedAgeGroups = []
            const selectedTags = []
            checkboxes.forEach(cb => {
                if (cb.checked && cb.name === 'categories') {
                    selectedCategories.push(cb.value)
                    if (!filterPriority.includes(cb.name)) {
                        filterPriority.push(cb.name)
                    }
                } else if (cb.checked && cb.name === 'age_groups') {
                    selectedAgeGroups.push(cb.value)
                    if (!filterPriority.includes(cb.name)) {
                        filterPriority.push(cb.name)
                    }
                } else if (cb.checked && cb.name === 'tags') {
                    selectedTags.push(cb.value)
                    if (!filterPriority.includes(cb.name)) {
                        filterPriority.push(cb.name)
                    }
                }
            })

            // Updates the filterPriority if any filter groups have been reset.
            if (selectedCategories.length === 0 && filterPriority.includes('categories')) {
                filterPriority.splice(filterPriority.indexOf('categories'), 1)
            }
            if (selectedAgeGroups.length === 0 && filterPriority.includes('age_groups')) {
                filterPriority.splice(filterPriority.indexOf('age_groups'), 1)
            }
            if (selectedTags.length === 0 && filterPriority.includes('tags')) {
                filterPriority.splice(filterPriority.indexOf('tags'), 1)
            }

            // Send AJAX request to the server
            const xhr = new XMLHttpRequest()
            xhr.open('POST', '/attractions/filter', true)
            xhr.setRequestHeader('Content-Type', 'application/json')
            xhr.onreadystatechange = function () {

                // Receive AJAX response from the server
                if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                    const response = JSON.parse(xhr.responseText)
                    const attractions = response.attractions
                    const categoryIDs = response.categoryIDs
                    const ageGroupIDs = response.ageGroupIDs
                    const tagIDs = response.tagIDs

                    // Update the filtered attractions content
                    document.getElementById('filtered-results').innerHTML = ''
                    attractions.forEach(function (attractionHTML) {
                        document.getElementById('filtered-results').innerHTML += attractionHTML
                    })

                    // Update the category filter checkboxes
                    const categoryCheckbox = document.getElementById('category-checkbox')
                    if (categoryCheckbox) {
                        const checkboxInputs = categoryCheckbox.querySelectorAll('input[type="checkbox"]')
                        updateCheckboxes(checkboxInputs, categoryIDs)
                    }
                    // Update the age group filter checkboxes
                    const ageGroupCheckbox = document.getElementById('age-group-checkbox')
                    if (ageGroupCheckbox) {
                        const checkboxInputs = ageGroupCheckbox.querySelectorAll('input[type="checkbox"]')
                        updateCheckboxes(checkboxInputs, ageGroupIDs)
                    }
                    // Update the tag filter checkboxes
                    const tagCheckbox = document.getElementById('tag-checkbox')
                    if (tagCheckbox) {
                        const checkboxInputs = tagCheckbox.querySelectorAll('input[type="checkbox"]')
                        updateCheckboxes(checkboxInputs, tagIDs)
                    }
                }
            }
            xhr.send(JSON.stringify({
                selectedCategories: selectedCategories,
                selectedAgeGroups: selectedAgeGroups,
                selectedTags: selectedTags,
                searchText: searchText,
                filterPriority: filterPriority
            }))
        })
    })
}

// Displays the profile tabs and select active tab
function profileTabs(tabs, activeTab=0) {    
    return {
        tabs,
        activeTab: tabs[activeTab],
        
        setActiveTab(tab) {
            this.activeTab = tab
        },
    }
}

// Function to update the availability and count labels of given checkboxes
function updateCheckboxes(checkboxes, activeIDs) {
    checkboxes.forEach(checkbox => {
        if (activeIDs.includes(checkbox.value)) {
            checkbox.removeAttribute('disabled')
        } else {
            checkbox.setAttribute('disabled', 'disabled')
            checkbox.checked = false
        }
    })
}

const citySelectMobile = () => {
    const citySelect = document.getElementById('citySelectMobile');
    const form = document.getElementById('cityFormMobile');
    if(!citySelect && !form) return

    selectCity(citySelect, form)
}

const citySelectAnonymous = () => {
    const citySelect = document.getElementById('citySelectAnonymous');
    const form = document.getElementById('cityFormAnonymous');
    if(!citySelect && !form) return

    selectCity(citySelect, form)
}

const citySelectDesktop = () => {
    const citySelect = document.getElementById('citySelectDesktop');
    const form = document.getElementById('cityFormDesktop');
    if(!citySelect && !form) return

    selectCity(citySelect, form)
}

const selectCity = (citySelect, form) => {

    const options = citySelect.querySelectorAll('option');
    options.forEach(option => {
        if (option.value === sessionStorage.getItem('selectedCity')) {
            option.selected = true;
        }
    })
    citySelect.addEventListener('change', (e) => {
        sessionStorage.setItem('selectedCity', e.target.value);
        const formData = new FormData(form);
        
        fetch(form.action, {
            method: form.method,
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.errors) console.log(data.errors);
            if(location.pathname === '/attractions') {
                location.reload();
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
    })
}

function markAsVisited(attractionId, checked) {
  fetch(`/attractions/${attractionId}/mark_as_visited`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ visited: checked }),
  })
    .then((response) => response.json())
    .then((data) => {
      console.log(data); // Handle server response here
    })
    .catch((error) => console.error("Error:", error));
}

const visitedAttraction = (attractionId, visited) => {
    return {
        visited: visited,
        attractionId: attractionId,
        addToVisited() {
            this.visited = true
            markAsVisited(this.attractionId, true)
        },
        removeFromVisited() {
            this.visited = false
            markAsVisited(this.attractionId, false)
        }
    }
}

function addToWishlist(attractionId, checked) {
    fetch(`/attractions/${attractionId}/add_to_wishlist`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ wishlist: checked })
    })
    .then(response => response.json())
    .then(data => {
      console.log(data);  // Handle server response here
    })
    .catch(error => console.error('Error:', error));
  }

const wishlist = (attractionId, groups) => {
    return {
        groups: groups,
        inAllGroups: groups.every(group => group.visited),
        editList: false,
        attractionId: attractionId,

        toggleEditList() {
            this.editList = !this.editList
        },

        addToGroup(groupId) {
            // TODO: Backend logic to add attraction to group
            console.log('add to group', groupId);
        },

        removeFromGroup(groupId) {
            // TODO: Backend logic to remove attraction from group
            console.log('remove from group', groupId);
        
        }
    }
}


const userGroups = (groups) => {
    const btn = document.querySelector('.add-group-btn')

    return {
        groups,
        showGroupForm: false,
        deleteGroup(groupId) {
            fetch(`/auth/delete-group`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    // TODO: Add CSRF token
                },
                body: JSON.stringify({ groupId: groupId })
            }).then(res => {
                if (res.ok) {
                    this.groups = this.groups.filter(group => group.id !== groupId)
                }
            }).catch(err => {
                console.error(err)
            })
        },
        showForm() {
            this.showGroupForm = true
            btn.style.display = 'none'
        },
        hideForm() {
            this.showGroupForm = false
            btn.style.display = 'block'
        }
    }
}

document.addEventListener('DOMContentLoaded', () => {
    disableCheckboxes()
    filterAttractions()
    truncateAttractionDescription()
    citySelectDesktop()
    citySelectMobile()
    citySelectAnonymous()
})
