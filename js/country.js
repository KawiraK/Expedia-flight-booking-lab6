$(document).ready(function(){
    const countrymodal=$('#countrydetailsmodal'),
    addnewcountrybutton=$('#addnewcountry')
    countryidfield=$('#countryid')
    countrynamefield=$('#countryname')
    savecountrybutton=$('#savecountry')
    notifications=$('#notifications')
    countriestable=$('#countriestable')
    countrynotifications=$('#countrynotifications')

    //load countries table
    getcountriestable()

    addnewcountrybutton.on('click',function(){
        countrymodal.modal('show')
    })

    savecountrybutton=$('#savecountry').on('click',function(){
        const countryname=countrynamefield.val(),
        countryid=countryidfield.val()
        if(countryname == ""){
            notifications.html("<div class='alert alert-primary'>Please enter country name</div>")
            countrynamefield.focus()
        }else{
            $.post{
                "controllers/countryoperations.php",
                {
                    savecountry:true,
                    countryid:countryid,
                    countryname:countryname
                },
                function(data){
                    if(isJsonObject(data)){
                        data=JSON.parse(data)
                        if(data.status=="success"){
                            notifications.html("<div class='alert alert-success'>country has been saved successfully</div>")
                            countrynamefield.val("")
                            countrynamefield.focus()
                            //refresh countries table
                            getcountriestable()
                        }else if (data.status=="exists"){
                            notifications.html("<div class='alert alert-info'>country name already exists  in the system</div>")
                            countrynamefield.focus()
                        }
                    }else{
                        notifications.html("<div class='alert alert-danger'>sorry an error occurred</div>")
                    }
                }
            }
        }
    })

    countrynamefield.on('input',function(){
        notifications.html("")
    })

    function isJson(str){
        try{
           return (JSON.parse(str) && !!str);  
        }catch(e){
            return false
        }
    }

    function getcountriestable(){
        $.getJSON(
            "controllers/countryoperations.php",
            {
                getcountries:true
            }
        ).done(function(data){
            let results=""
            data.forEach(function(country,i){ 
                results+="<tr><td>$(i+1)</td>"
                results+="<td>$(country.countryname)</td>"
                results+="<td>$(country.countrycities)</td>"
                results+="<td>$(country.countryairports)</td>"
                results+="<td>$(country.countryairlines)</td>"
                results+="<td><a href='#'><i class='fas fa-edit fa-lg'></i></a></td></tr>"
            })
            //done with looping through the data that is returned
            countriestable.find('tbody').html(results)  
        }),fail(function(response, status, error){
            //console.log('sorry an error occured $(response.responseText)')

            countrynotifications.html("<div class='alert alert-danger'>sorry an error occurred while loading countries</div>")
        })
    }
})