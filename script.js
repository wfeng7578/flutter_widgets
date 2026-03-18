document.addEventListener('DOMContentLoaded', () => {
    const contentDiv = document.getElementById('content');
    const tocNav = document.getElementById('toc');
    const searchInput = document.getElementById('searchInput');

    // Fetch Markdown content
    fetch(encodeURIComponent('Flutter组件大全.md'))
        .then(response => {
            if (!response.ok) {
                throw new Error(`Failed to load markdown file: ${response.statusText}`);
            }
            return response.text();
        })
        .then(markdown => {
            // Configure marked options
            marked.use({
                gfm: true,
                breaks: true,
            });

            // Render Markdown
            contentDiv.innerHTML = marked.parse(markdown);

            // Post-process: Add IDs to headers and generate TOC
            generateTOC();

            // Highlight code blocks
            document.querySelectorAll('pre code').forEach((block) => {
                hljs.highlightElement(block);
            });

            // Setup Search
            setupSearch();

            // Setup Scroll Spy
            setupScrollSpy();
        })
        .catch(error => {
            contentDiv.innerHTML = `<div class="error" style="color:red; padding:20px;">
                <h3>加载失败</h3>
                <p>无法读取 Markdown 文件。请确保文件名正确且未被移动。</p>
                <p>错误信息: ${error.message}</p>
                <p>提示：如果是本地直接打开 HTML 文件，可能会遇到跨域限制。请使用 VS Code 的 "Live Server" 插件或 Python http.server 启动本地服务。</p>
            </div>`;
            console.error(error);
        });

    function generateTOC() {
        const headers = contentDiv.querySelectorAll('h1, h2, h3');
        const tocList = document.createElement('ul');
        tocList.className = 'toc-root';
        // Clear existing content
        tocNav.innerHTML = '';

        headers.forEach((header, index) => {
            // Create ID if not exists or ensure unique
            if (!header.id) {
                const slug = header.textContent
                    .trim()
                    .toLowerCase()
                    .replace(/[^a-z0-9\u4e00-\u9fa5]+/g, '-') // Support Chinese characters
                    .replace(/^-+|-+$/g, '');
                header.id = slug || `section-${index}`;
            }

            // Create TOC item wrapper
            const li = document.createElement('li');
            li.className = `toc-item-wrapper level-${header.tagName.toLowerCase()}`;

            // Create Link
            const link = document.createElement('a');
            link.className = 'toc-item';
            link.textContent = header.textContent;
            link.href = `#${header.id}`;
            link.dataset.target = header.id;

            // Smooth scroll on click
            link.addEventListener('click', (e) => {
                e.preventDefault();
                header.scrollIntoView({ behavior: 'smooth', block: 'start' });
                // Update URL hash
                history.pushState(null, null, `#${header.id}`);

                // Manually update active state immediately
                document.querySelectorAll('.toc-item').forEach(item => item.classList.remove('active'));
                link.classList.add('active');
            });

            li.appendChild(link);
            tocList.appendChild(li);
        });

        tocNav.appendChild(tocList);
    }

    function setupSearch() {
        searchInput.addEventListener('input', (e) => {
            const query = e.target.value.toLowerCase();
            const items = tocNav.querySelectorAll('.toc-item-wrapper');

            items.forEach(li => {
                const link = li.querySelector('a');
                const text = link.textContent.toLowerCase();
                if (text.includes(query)) {
                    li.style.display = 'block';
                } else {
                    li.style.display = 'none';
                }
            });
        });
    }

    function setupScrollSpy() {
        const contentArea = document.querySelector('.content-area');
        const tocItems = Array.from(tocNav.querySelectorAll('.toc-item'));

        // Function to find active section
        const onScroll = () => {
            const headers = Array.from(contentDiv.querySelectorAll('h1, h2, h3'));
            if (headers.length === 0) return;

            let currentHeader = null;
            // Offset to consider "active" (e.g., header is near top of viewport)
            const offset = 100;

            // Find the last header that is above the cutoff
            // Use contentArea.scrollTop instead of window.scrollY because of our layout
            const scrollPos = contentArea.scrollTop;

            // Alternatively, use getBoundingClientRect relative to viewport
            // Since headers are inside contentArea which scrolls

            for (const header of headers) {
                const rect = header.getBoundingClientRect();
                // If header is above a threshold (e.g. 150px from top of viewport)
                if (rect.top < 150) {
                    currentHeader = header;
                } else {
                    // Once we find a header below the threshold, the previous one was the current one
                    break;
                }
            }

            if (currentHeader) {
                const id = currentHeader.id;
                tocItems.forEach(item => {
                    if (item.dataset.target === id) {
                        item.classList.add('active');
                        // Optional: Scroll TOC to keep active item in view
                        item.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
                    } else {
                        item.classList.remove('active');
                    }
                });
            }
        };

        // Throttled scroll listener on the scrollable container
        let ticking = false;
        contentArea.addEventListener('scroll', () => {
            if (!ticking) {
                window.requestAnimationFrame(() => {
                    onScroll();
                    ticking = false;
                });
                ticking = true;
            }
        });

        // Initial check
        onScroll();
    }

    // Back to Top Button Logic
    const backToTopBtn = document.getElementById('backToTop');
    const contentArea = document.querySelector('.content-area');

    contentArea.addEventListener('scroll', () => {
        if (contentArea.scrollTop > 300) {
            backToTopBtn.classList.add('visible');
        } else {
            backToTopBtn.classList.remove('visible');
        }
    });

    backToTopBtn.addEventListener('click', () => {
        contentArea.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });
});