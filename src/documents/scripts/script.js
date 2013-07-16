function getHtmlCategories(categories) {
    var categoriesHtml = "", i;
    for ( i = 0; i < this.categories.length; i++) {
        if (i !== 0) {
            categoriesHtml += ', ';
        }
        
        categoriesHtml += '<a href="' + this.categories[i].toLowerCase() + '">' + this.categories[i] + '</a>';
    }
    return categoriesHtml;
}

function getCssCategory(categories) {
    
}
