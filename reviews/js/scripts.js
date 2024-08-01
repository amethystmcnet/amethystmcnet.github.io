function swalFire(text, type = "success", time = 3000){
    Swal.fire({
        titleText: text,
        icon: type,
        toast: true,
        position: 'bottom-start',
        timer: time,
        showConfirmButton: false,
        customClass: {
            container: 'wiki-toast'
        }
    });
}

$(document).ready(function() {

    function hideSection(id){
        $('.modal-header.review_actions_modal_' + id).hide();
        $('.content.review_actions_modal_' + id).hide();
    }
    
    function showSection(id){
        $('.modal-header.review_actions_modal_' + id).show();
        $('.content.review_actions_modal_' + id).show();
    }
    
    let selectedType;
    let selectedTypeID;
    let selectedRate = 1;
    let feedback_submit_button = $('#feedback_submit');
    let noReviewsContainer = $('#no_reviews_container');
    let noFilterReviewsContainer = $('#filter_no_reviews_container');
    let mainContainer = $('#reviews_container').html();
    let selectedElement = null;
    let totalScore = $('#average_score_text');

    let reviewsKeyword = $('#reviews_keyword').html();
    let modal_container = '.modal.review_actions_modal';
    let okayButton = '.modal.review_actions_modal .ok';

    let currentDropdown = null;
    $('.modal').modal('hide');

    $('#feedback_button').on('click', function(e){
        $('.feedbackModal').modal('show');
    }); 

    $('input.ui.rating').on('change', function(event) {
        selectedRate = $(this).val();
        let rating = $(event.target).val();
        $(event.target).closest('input.ui.rating').data('rating',rating);
    });

    $('.dropdown.select_type .dropdown-item').on('click', function(){
        let value = $(this).val();
        let text = $(this).text().trim();
        selectedType = text;
        selectedTypeID = value;
    });

    /* $(document).on("click", function(event){
        if(!$(event.target).closest(".dropdown-toggle").length){
            $(".dropdown-toggle").each(function() {
                if($(this).data('value') != null){
                    if($(this).data('value') == currentDropdown){
                        $(this).dropdown('toggle');
                        currentDropdown = null;
                    }
                }
            });
        }
    }); */

    $(".dropdown-toggle").click(function(e) {
        currentDropdown = $(this).data('value');
        $(".dropdown-toggle").each(function() {
            if($(this).data('value') != null){
                if($(this).data('value') != currentDropdown && $(this).hasClass('show')){
                    $($(this)).dropdown('toggle');
                }
            }
        });
        if(!$(e.target).closest(".dropdown").length){
            $($(this)).dropdown('toggle');
        }
    });

    $(".dropdown-item").click(function(e) {
        let currentButton = $(this).parent().siblings('.dropdown-toggle');
        let value = $(currentButton).data('value');
        let selection = $(this).data('value');
        switch(value){
            case "filter":{
                $('#reviews_container').hide();
                $('#reviews_container').html(mainContainer);
                if($(noFilterReviewsContainer).is(":visible")){
                    $(noFilterReviewsContainer).attr('style','display: none !important');
                }
                let i = 0;

                if($($(this)).is(':first-child')){
                    //$(".ui.dropdown.review_filter").dropdown("restore defaults");
                } else {
                    $("#reviews_container").children().each(function() {
                        const type = $(this).data('value');
                        if(type != selection){
                            $(this).attr('style','display: none !important');
                        } else if(type == selection){
                            $(this).attr('style','display: block !important');
                            i++;
                        }
                    });
                    if(i <= 0){ 
                        if(!$(noFilterReviewsContainer).is(":visible")){
                            $(noFilterReviewsContainer).attr('style','display: block !important'); 
                        }
                    }
                }
                $('#reviews_container').show();
                $('#reviews_container').find('input.ui.rating').rating();
                break;
            }
            case "sort":{
                const sortBy = selection.split('_');
                const sortValue = sortBy[0];
                const sortOrder = sortBy[1];

                $('#reviews_container .column').sort(function(a, b) {
                    switch(sortValue){
                        case "date":{
                            const A_Date = new Date($(a).data(sortValue));
                            const B_Date = new Date($(b).data(sortValue));
                            if(sortOrder == 'asc'){
                                return A_Date - B_Date;
                            } else if(sortOrder == 'desc'){
                                return B_Date - A_Date;
                            }
                            break;
                        }
                        case "rating":{
                            const aValue = $(a).find('input.ui.rating').val();
                            const bValue = $(b).find('input.ui.rating').val();
                            if(sortOrder == 'asc'){
                                return aValue - bValue;
                            } else if(sortOrder == 'desc'){
                                return bValue - aValue;
                            }
                            break;
                        }
                        case "likes":{
                            const aValue = $(a).find('.likes_counter').html();
                            const bValue = $(b).find('.likes_counter').html();
                            if(sortOrder == 'asc'){
                                return aValue - bValue;
                            } else if(sortOrder == 'desc'){
                                return bValue - aValue;
                            }
                            break;
                        }
                    }
                }).appendTo('#reviews_container');
                break;
            }
            case "default":{
                break;
            }
        }
        $(currentButton).dropdown('hide');
        e.preventDefault();
        e.stopPropagation();

        return false;
    }); 

    $('i.review_actions').on('click', function(e){
        selectedElement = $(e.target).closest('.column');
        $(modal_container).attr("id",e.target.id);
       
        if($(e.target).hasClass('unlist_icon_button')){
            $(modal_container).attr("value","unlist");
            $(okayButton).css('background-color','#FFBB3B');
            $(okayButton).css('border-color','#FFBB3B');
            hideSection('remove');
            hideSection('approve');
            hideSection('unapprove');
            hideSection('restore');
            showSection('unlist');
        } else if($(e.target).hasClass('remove_icon_button')){
            $(modal_container).attr("value","remove");
            $(okayButton).css('background-color','#FF673B');
            $(okayButton).css('border-color','#FF673B');
            hideSection('unlist');
            hideSection('approve');
            hideSection('unapprove');
            hideSection('restore');
            showSection('remove');
        } else if($(e.target).hasClass('approve_icon_button')){
            $(modal_container).attr("value","approve");
            $(okayButton).css('background-color','#8BDE28');
            $(okayButton).css('border-color','#8BDE28');
            hideSection('unlist');
            hideSection('remove');
            hideSection('unapprove');
            hideSection('restore');
            showSection('approve');
        } else if($(e.target).hasClass('unapprove_icon_button')){
            $(modal_container).attr("value","unapprove");
            $(okayButton).css('background-color','#D73C12');
            $(okayButton).css('border-color','#D73C12');
            hideSection('unlist');
            hideSection('remove');
            hideSection('approve');
            hideSection('restore');
            showSection('unapprove');
        } else if($(e.target).hasClass('restore_icon_button')){
            $(modal_container).attr("value","restore");
            $(okayButton).css('background-color','#3CB4D1');
            hideSection('unlist');
            hideSection('remove');
            hideSection('approve');
            hideSection('unapprove');
            showSection('restore');
        }
        //$(".review_actions_modal").modal('show');
        $(modal_container).modal('show');
    });

    $(document).on('click', '.row .column .like.icon.like_button', function(e){
        let votesCount = e.target.parentNode.querySelector('.likes_counter');
        let buttonAction = e.target.getAttribute('value');
        let button = e.target;

        if(!$(this).hasClass("disabled")){
            const actionUrl = '/queries/review_like?id={$USER_ID}';
            const params = {
                review_id: e.target.id
            }
            $.ajax({
                url: actionUrl,
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(params),
                beforeSend: function() {
                    $(button).addClass('loading');
                },
                success: function(response){
                    if (!$.trim(response)){
                        if($(e.target).hasClass('active_icon')) {
                            swalFire('You unliked this review successfully!');
                            $(e.target).removeClass('active_icon');
                            $(e.target).siblings().text(function(i, t) {
                                return Number(t) - 1;
                            });
                        } else {
                            swalFire('You liked this review successfully!');
                            $(e.target).addClass('active_icon');
                            $(e.target).siblings().text(function(i, t) {
                                return Number(t) + 1;
                            });
                        }
                    } else {
                        swalFire(response, 'error');
                    }
                },
                error: function (result) {
                    swalFire(response, 'error');
                },
                complete : function(event,xhr,options){
                    $(button).removeClass('loading');
                }
            });
        }
    });

    $( ".modal.feedbackModal form.feedback" ).submit(function( e ) {
        e.preventDefault();    
        $(feedback_submit_button).addClass('disabled');
        let fedForm = $(this).validate({
            rules:
            {
                type: {
                    required: true,
                },
                rating: {
                    required: true,
                },
                title: {
                    required: true,
                    minlength: 4,
                    maxlength: 48
                },
                textarea: {
                    required: true,
                    minlength: 16,
                    maxlength: 2048
                }
            },
            messages:
            {
                type: "Please select review type",
                rating: "Please select rating",
                title:{
                    required: "Please fill the review title",
                    minlength: "Title must have at least 4 characters",
                    maxlength: "Title must have maximum of 48 characters"
                },
                textarea:{
                    required: "Please fill the text area",
                    minlength: "Message must have at least 16 characters",
                    maxlength: "Message must have maximum of 2048 characters"
                }
            },
        });
    
        if(fedForm.valid()){
            const createUrl = '/queries/review_create';
            $.ajax({    
                type : 'POST',
                url  : createUrl,
                data: {
                    type: selectedType,
                    typeid: selectedTypeID,
                    rating: selectedRate,
                    title: $('#reviewTitleInput').val(),
                    textarea: $('#thoughtsTextarea').val()
                },
                success :  function(response) { 
                    if (!$.trim(response)){
                        swalFire('You sent a feedback successfully!');
                        $(feedback_submit_button).removeClass('disabled');
                        $("form.feedback").trigger("reset");
                        $('.feedbackModal').modal('hide');
                        setTimeout(function () {
                            location.reload(true);
                        }, 4000);
                    } else {
                        swalFire(response, 'error');
                        $(feedback_submit_button).removeClass('disabled');
                    }
                },
                error: function(req, jqXHR, exception) {
                    swalFire(response, 'error');
                    $(feedback_submit_button).removeClass('disabled');
                }
              });
        } else {
            swalFire("Something wen't wrong, Try again.", 'error');
            $(feedback_submit_button).removeClass('disabled');
        }
    });

    $(document).on('click', '.review_actions_modal .actions .cancel', function(e){
        $(modal_container).modal('hide');
    });

    $(document).on('click', '.review_actions_modal .actions .ok', function(e){
        let target = $(e.target);
        let action = $(modal_container).attr('value');
        let actionUrl = '';
        switch(action){
            case 'remove':{
                actionUrl = '/queries/review_remove';
                break;
            }
            case 'unlist':{
                actionUrl = '/queries/review_unlist';
                break;
            }
            case 'approve':{
                actionUrl = '/queries/review_approve';
                break;
            }
            case 'unapprove':{
                actionUrl = '/queries/review_unapprove';
                break;
            }
            case 'restore':{
                actionUrl = '/queries/review_restore';
                break;
            }
        }
        $.ajax({    
            type : 'POST',
            url  : actionUrl,
            data: { review_id: $('.review_actions_modal').attr("id") },
            beforeSend: function(response){

            },
            success :  function(response) { 
                if (!$.trim(response)){
                    swalFire('You '+action+'ed the feedback successfully!');
                    switch(action){
                        case 'remove':{
                            selectedElement.fadeOut('slow', function() {
                                selectedElement.attr("style", "display: none !important");
                                selectedElement = null;    
                            });
                            break;
                        }
                        case 'unlist':{
                            selectedElement.find('i.review_actions.approve_icon_button').hide();
                            selectedElement.find('i.review_actions.unapprove_icon_button').hide();
                            selectedElement.find('i.review_actions.unlist_icon_button').hide();
                            selectedElement.find('i.review_actions.restore_icon_button').show();
                            selectedElement.find('i.review_actions.remove_icon_button').show();
                            break;
                        }
                        case 'approve':{
                            selectedElement.find('i.review_actions.approve_icon_button').hide();
                            selectedElement.find('i.review_actions.unapprove_icon_button').hide();
                            selectedElement.find('i.review_actions.unlist_icon_button').show();
                            selectedElement.find('i.review_actions.restore_icon_button').hide();
                            selectedElement.find('i.review_actions.remove_icon_button').show();
                            selectedElement.find('.extra.content.status_review').hide();
                            break;
                        }
                        case 'unapprove':{
                            selectedElement.find('i.review_actions.approve_icon_button').show();
                            selectedElement.find('i.review_actions.unapprove_icon_button').hide();
                            selectedElement.find('i.review_actions.unlist_icon_button').hide();
                            selectedElement.find('i.review_actions.restore_icon_button').hide();
                            selectedElement.find('i.review_actions.remove_icon_button').show();
                            break;
                        }
                        case 'restore':{
                            selectedElement.find('i.review_actions.approve_icon_button').hide();
                            selectedElement.find('i.review_actions.unapprove_icon_button').hide();
                            selectedElement.find('i.review_actions.unlist_icon_button').show();
                            selectedElement.find('i.review_actions.restore_icon_button').hide();
                            selectedElement.find('i.review_actions.remove_icon_button').show();
                            selectedElement.find('.extra.content.status_review').hide();
                            break;
                        }
                    }
                    mainContainer = $('#reviews_container').html(); /* Save the new results for filtering purpose */
                } else {
                    swalFire(response, 'error');
                }
            },
            error: function(response){
                swalFire(response, 'error');
            }
            });
        $('.modal.review_actions_modal').modal('hide');
    });

    function sortElement(selector, child, data) {
        $(selector).find(child).sort(function(a, b) {
            return $(a).data(data) - $(b).attr(data);
        }).appendTo(selector);
    }
});