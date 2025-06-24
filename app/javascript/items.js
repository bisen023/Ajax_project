$(document).ready(function () {
  $('.filter-btn').on('click', function () {
    var category = $(this).data('category');

    $.ajax({
      url: '/items/filter',
      method: 'GET',
      dataType: 'script',
      data: { category: category }
    });
  });

  $('.show-link').on('click',function () {
    var id = $(this).data('id');
    $.ajax({
      url: '/items/' + id,
      method: 'GET',
      dataType: 'script'
    });
  });


$('.new-item-link').on('click', function(e){
  e.preventDefault();

  $.ajax({
    url: '/items/new',
    method: 'get',
    dataType: 'script'
  })
})


});
