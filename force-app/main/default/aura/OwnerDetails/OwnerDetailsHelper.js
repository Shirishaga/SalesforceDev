({
    getUser : function(component, event, helper) {      
        var action = component.get('c.getUser');
        action.setParams({
            recId:component.get("v.recordId")});
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.usr",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})