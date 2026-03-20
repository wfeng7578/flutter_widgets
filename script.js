
// Syntax Highlighting
document.addEventListener('DOMContentLoaded', (event) => {
    document.querySelectorAll('pre code').forEach((el) => {
        hljs.highlightElement(el);
    });
});

// Toggle Sidebar Categories
function toggleCategory(element) {
    element.parentElement.classList.toggle('collapsed');
}

// Search Functionality
const searchInput = document.getElementById('searchInput');
const cards = document.querySelectorAll('.markdown-body');
const categories = document.querySelectorAll('.category-section');
const navItems = document.querySelectorAll('.toc-item');
const navCategories = document.querySelectorAll('.toc-category');
const noResults = document.getElementById('noResults');

searchInput.addEventListener('input', (e) => {
    const query = e.target.value.toLowerCase().trim();
    let hasVisibleCards = false;

    // Reset all if query is empty
    if (query === '') {
        cards.forEach(c => c.style.display = 'block');
        categories.forEach(c => c.style.display = 'block');
        navItems.forEach(n => n.style.display = 'block');
        navCategories.forEach(n => {
            n.style.display = 'block';
            n.classList.remove('collapsed');
        });
        noResults.style.display = 'none';
        return;
    }

    // Search logic
    categories.forEach(category => {
        let hasVisibleCardInCategory = false;
        const catCards = category.querySelectorAll('.markdown-body');
        let firstNavItem = null;
        
        catCards.forEach(card => {
            const searchText = card.getAttribute('data-search-text') || '';
            const compId = card.id;
            const navItem = document.querySelector(`.toc-item[data-target="${compId}"]`);
            if (!firstNavItem && navItem) {
                firstNavItem = navItem;
            }
            
            if (searchText.includes(query)) {
                card.style.display = 'block';
                if(navItem) navItem.style.display = 'block';
                hasVisibleCardInCategory = true;
                hasVisibleCards = true;
            } else {
                card.style.display = 'none';
                if(navItem) navItem.style.display = 'none';
            }
        });

        // Hide/show category section
        const navCategory = firstNavItem ? firstNavItem.closest('.toc-category') : null;
        
        if (hasVisibleCardInCategory) {
            category.style.display = 'block';
            if(navCategory) {
                navCategory.style.display = 'block';
                navCategory.classList.remove('collapsed'); // Auto expand matched categories
            }
        } else {
            category.style.display = 'none';
            if(navCategory) navCategory.style.display = 'none';
        }
    });

    noResults.style.display = hasVisibleCards ? 'none' : 'block';
});

// Scroll Spy & Active Nav Item
const contentArea = document.getElementById('contentArea');
const tocItems = Array.from(document.querySelectorAll('.toc-item'));

contentArea.addEventListener('scroll', () => {
    let currentActive = null;
    const scrollPos = contentArea.scrollTop;
    
    // Back to top button
    const backBtn = document.getElementById('backToTop');
    if (scrollPos > 300) {
        backBtn.classList.add('visible');
    } else {
        backBtn.classList.remove('visible');
    }

    // Find current visible component
    const allCards = Array.from(document.querySelectorAll('.markdown-body'));
    for (const card of allCards) {
        if (card.style.display === 'none') continue;
        
        const rect = card.getBoundingClientRect();
        // 150px offset from top
        if (rect.top < 150 && rect.bottom > 150) {
            currentActive = card.id;
            break;
        }
    }

    if (currentActive) {
        tocItems.forEach(item => {
            if (item.getAttribute('data-target') === currentActive) {
                item.classList.add('active');
                // Expand parent category if collapsed
                const parentCat = item.closest('.toc-category');
                if (parentCat && parentCat.classList.contains('collapsed')) {
                    parentCat.classList.remove('collapsed');
                }
            } else {
                item.classList.remove('active');
            }
        });
    }
});

// Back to top click
document.getElementById('backToTop').addEventListener('click', () => {
    contentArea.scrollTo({ top: 0, behavior: 'smooth' });
});

// Smooth scroll for nav clicks
document.querySelectorAll('.toc-item').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const targetId = this.getAttribute('href').substring(1);
        const targetElement = document.getElementById(targetId);
        
        if (targetElement) {
            targetElement.scrollIntoView({ behavior: 'smooth' });
            history.pushState(null, null, `#${targetId}`);
            
            document.querySelectorAll('.toc-item').forEach(item => item.classList.remove('active'));
            this.classList.add('active');
            
            // 移动端：点击菜单后自动收起侧边栏
            if (window.innerWidth <= 768) {
                if (typeof toggleMobileMenu === 'function') {
                    toggleMobileMenu();
                }
            }
        }
    });
});

// 移动端菜单控制
const mobileMenuBtn = document.getElementById('mobileMenuBtn');
const sidebar = document.querySelector('.sidebar');
const menuOverlay = document.getElementById('menuOverlay');

function toggleMobileMenu() {
    if (sidebar) sidebar.classList.toggle('active');
    if (menuOverlay) menuOverlay.classList.toggle('active');
}

if (mobileMenuBtn) {
    mobileMenuBtn.addEventListener('click', toggleMobileMenu);
}
if (menuOverlay) {
    menuOverlay.addEventListener('click', toggleMobileMenu);
}

// Sort Tabs Functionality
const sortTabs = document.querySelectorAll('.sort-tab');
const tocCategory = document.getElementById('toc-category');
const tocFreq = document.getElementById('toc-freq');
const contentCategory = document.getElementById('content-category');
const contentFreq = document.getElementById('content-freq');

sortTabs.forEach(tab => {
    tab.addEventListener('click', () => {
        sortTabs.forEach(t => t.classList.remove('active'));
        tab.classList.add('active');
        
        const sortType = tab.getAttribute('data-sort');
        
        // 切换显示内容
        if (sortType === 'category') {
            tocFreq.style.display = 'none';
            contentFreq.style.display = 'none';
            tocCategory.style.display = 'block';
            contentCategory.style.display = 'block';
        } else {
            tocCategory.style.display = 'none';
            contentCategory.style.display = 'none';
            tocFreq.style.display = 'block';
            contentFreq.style.display = 'block';
        }
    });
});
