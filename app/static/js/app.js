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

// Get updated attractions content based on changes made to filtering checkboxes
const filterAttractionsGridContent = () => {
    // Add event listener to checkboxes
    const checkboxes = document.querySelectorAll('.filter input[type="checkbox"]')
    if (!checkboxes) return

    // Parse URL parameters
    const urlParams = new URLSearchParams(window.location.search);
    let search_text = urlParams.get('search');
    let filterPriority = urlParams.get('filterPriority') ? urlParams.get('filterPriority').split(',') : [];
    let selectedCategories = urlParams.get('categories') ? urlParams.get('categories').split(',') : [];
    let selectedAgeGroups = urlParams.get('age_groups') ? urlParams.get('age_groups').split(',') : [];
    let selectedTags = urlParams.get('tags') ? urlParams.get('tags').split(',') : [];

    checkboxes.forEach(checkbox => {
        checkbox.addEventListener('change', () => {
            if (checkbox.checked) {
                // Add the value to the respective list if the checkbox is checked
                if (checkbox.name === 'categories') {
                    selectedCategories.push(checkbox.value);
                    if (!filterPriority.includes(checkbox.name)) {
                        filterPriority.push(checkbox.name);
                    }
                } else if (checkbox.name === 'age_groups') {
                    selectedAgeGroups.push(checkbox.value);
                    if (!filterPriority.includes(checkbox.name)) {
                        filterPriority.push(checkbox.name);
                    }
                } else if (checkbox.name === 'tags') {
                    selectedTags.push(checkbox.value);
                    if (!filterPriority.includes(checkbox.name)) {
                        filterPriority.push(checkbox.name);
                    }
                }
            } else {
                // Remove the value from the respective list if the checkbox is unchecked
                if (checkbox.name === 'categories') {
                    selectedCategories = selectedCategories.filter(category => category !== checkbox.value);
                } else if (checkbox.name === 'age_groups') {
                    selectedAgeGroups = selectedAgeGroups.filter(ageGroup => ageGroup !== checkbox.value);
                } else if (checkbox.name === 'tags') {
                    selectedTags = selectedTags.filter(tag => tag !== checkbox.value);
                }
            }

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

            // Construct the URL with separate arguments for each filter type
            const urlParams = new URLSearchParams();
            if (search_text) {
                urlParams.append('search', search_text);
            }
            if (selectedCategories.length > 0) {
                urlParams.append('categories', selectedCategories.join(','));
            }
            if (selectedAgeGroups.length > 0) {
                urlParams.append('age_groups', selectedAgeGroups.join(','));
            }
            if (selectedTags.length > 0) {
                urlParams.append('tags', selectedTags.join(','));
            }
            if (filterPriority.length > 0) {
                urlParams.append('filterPriority', filterPriority.join(','));
            }

            // Update the URL
            const baseUrl = window.location.href.split('?')[0];
            const newUrl = `${baseUrl}?${urlParams.toString()}`;
            window.location.href = newUrl;

            ///// CODE FOR AJAX UPDATES BELOW BYPASSED CURRENTLY /////
            history.pushState(null, '', newUrl);

            // Fetch filtered attractions
            fetch(newUrl, {
                headers: {
                    'X-Requested-With': 'XMLHttpRequest'
                }
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.text();
                })
                .then(data => {
                    const jsonData = JSON.parse(data);
                    if (Array.isArray(jsonData.attractions)) {
                        const container = document.getElementById('filtered-results')
                        container.innerHTML = ''
                        jsonData.attractions.forEach(attractionHTML => {
                            container.innerHTML += attractionHTML
                        })
                        // Update the category filter checkboxes
                        const categoryCheckbox = document.getElementById('category-checkbox')
                        if (categoryCheckbox) {
                            const checkboxInputs = categoryCheckbox.querySelectorAll('input[type="checkbox"]')
                            updateCheckboxes(checkboxInputs, jsonData.categoryIDs, selectedCategories)
                        }
                        // Update the age group filter checkboxes
                        const ageGroupCheckbox = document.getElementById('age-group-checkbox')
                        if (ageGroupCheckbox) {
                            const checkboxInputs = ageGroupCheckbox.querySelectorAll('input[type="checkbox"]')
                            updateCheckboxes(checkboxInputs, jsonData.ageGroupIDs, selectedAgeGroups)
                        }
                        // Update the tag filter checkboxes
                        const tagCheckbox = document.getElementById('tag-checkbox')
                        if (tagCheckbox) {
                            const checkboxInputs = tagCheckbox.querySelectorAll('input[type="checkbox"]')
                            updateCheckboxes(checkboxInputs, jsonData.tagIDs, selectedTags)
                        }

                    } else {
                        console.error('Invalid data format:', jsonData)
                    }
                })
                .catch(error => {
                    console.error('Error fetching attractions:', error)
                })
        })
    })
}

// Displays the profile tabs and select active tab
function profileTabs(tabs, activeTab = 0) {
    return {
        tabs,
        activeTab: tabs[activeTab],

        setActiveTab(tab) {
            this.activeTab = tab;
            const tabIndex = this.tabs.findIndex(t => t === tab)
            updateUrlParams({ current_tab: tabIndex })
        }
    }
}

// Updates URL parameters
function updateUrlParams(params) {
    const urlParams = new URLSearchParams(window.location.search)
    for (const key in params) {
        if (params.hasOwnProperty(key)) {
            if (params[key] !== null && params[key] !== undefined) {
                urlParams.set(key, params[key])
            } else {
                urlParams.delete(key)
            }
        }
    }
    const newUrl = window.location.pathname + '?' + urlParams.toString()
    history.pushState({}, '', newUrl)
}

// Updates the visibility and selection status of checkboxes, based on given IDs
function updateCheckboxes(checkboxes, activeIDs, checkedIDs) {
    checkboxes.forEach(checkbox => {
        checkbox.checked = checkedIDs.includes(checkbox.value)
        checkbox.parentNode.style.display = activeIDs.includes(checkbox.value) ? '' : 'none'
    })
}

const citySelectMobile = () => {
    const citySelect = document.getElementById('citySelectMobile');
    const form = document.getElementById('cityFormMobile');
    if (!citySelect && !form) return

    selectCity(citySelect, form)
}

const citySelectAnonymous = () => {
    const citySelect = document.getElementById('citySelectAnonymous');
    const form = document.getElementById('cityFormAnonymous');
    if (!citySelect && !form) return

    selectCity(citySelect, form)
}

const citySelectDesktop = () => {
    const citySelect = document.getElementById('citySelectDesktop');
    const form = document.getElementById('cityFormDesktop');
    if (!citySelect && !form) return

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
                if (location.pathname === '/attractions') {
                    location.reload();
                }
            })
            .catch(error => {
                console.error('Error:', error);
            });
    })
}


// Redirects back to the previous visited URL
function goBack() {
    // Check if there's a history to go back to
    if (window.history.length > 1) {
        var previousUrl = document.referrer;
        window.location.href = previousUrl;
    } else {
        alert("No previous page available.");
    }
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
            console.log(data)
            // Update level element
            const levelElement = document.getElementById('level')
            if (levelElement) {
                levelElement.innerHTML = `<strong>${data.current_level}</strong>`
            }
        })
        .catch((error) => console.error("Error:", error))
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

const wishlist = (attractionId, groups) => {

    return {
        groups: groups,
        inAllGroups: groups.every(group => group.visited),
        editList: false,
        attractionId: attractionId,

        toggleEditList() {
            this.editList = !this.editList
        },

        createNewGroup() {
            fetch(`/attractions/add_to_group`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ attractionId: attractionId })
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    if (data.status === 'success') location.reload()
                })
                .catch(error => console.error('Error:', error));
        },


        addToGroup(groupId) {
            fetch(`/attractions/add_to_group`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ groupId: groupId, attractionId: attractionId })
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    this.groups = this.groups.map(group => {
                        if (group.id === groupId) {
                            group.visited = true
                        }
                        return group
                    })
                    this.inAllGroups = this.groups.every(group => group.visited)
                    return response.json();
                })
                .then(data => console.log(data))
                .catch(error => console.error('Error:', error));
        },

        removeFromGroup(groupId) {
            fetch(`/attractions/remove_from_group`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ groupId: groupId, attractionId: attractionId })
            }).then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                this.groups = this.groups.map(group => {
                    if (group.id === groupId) {
                        group.visited = false
                    }
                    return group
                })
                this.inAllGroups = this.groups.every(group => group.visited)
                return response.json();
            }).then(data => console.log(data))
                .catch(error => console.error('Error:', error));
        }
    }
}


const userGroups = (groups) => {
    const btn = document.querySelector('.add-group-btn')
    return {
        groups: groups.map(group => {
            return {
                id: group.id,
                title: group.title,
                visibility: group.visibility,
                attractions: group.grouped_attractions,
                image: group.grouped_attractions.length > 0 ? group.grouped_attractions[0].image : null
            }
        }),
        groupedAttractions: [],
        showAttractions: false,
        showGroupForm: false,
        editForm: false,
        currentGroup: null,

        deleteGroup(groupId) {
            fetch(`/auth/delete-group`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
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
            btn.style.display = 'flex'
        },

        showEditForm() {
            this.editForm = !this.editForm
        },

        getGroupAttractions(groupId) {
            this.currentGroup = this.groups.find(group => group.id === groupId)
            const form = document.querySelector('#editListForm')
            form.querySelector('#group_id').value = groupId
            form.querySelector('#name').value = this.currentGroup.title
            const visibilityOptions = form.querySelectorAll('#visibility option')
            visibilityOptions.forEach(option => {
                if (option.value === this.currentGroup.visibility) {
                    option.selected = true
                }
            })

            fetch(`/auth/group-attractions/${groupId}`, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                }
            }).then(response => {
                if (!response.ok) {
                    this.currentGroup = null
                    throw new Error('Network response was not ok');
                }
                this.groupedAttractions = response.json()
                this.showAttractions = true
            }).then(data => {
                console.log(data)
            }).catch(err => {
                console.error(err)
            })
        },

        backToGroups() {
            this.showAttractions = false
            this.groupedAttractions = []
            this.currentGroup = null
        },

        goToAttraction(attractionId) {
            window.location.href = `/attractions/${attractionId}`
        }

    }
}

document.addEventListener('DOMContentLoaded', () => {
    truncateAttractionDescription()
    filterAttractionsGridContent()
    citySelectDesktop()
    citySelectMobile()
    citySelectAnonymous()
})
