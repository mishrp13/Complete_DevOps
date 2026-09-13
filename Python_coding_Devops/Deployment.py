class Deployment:

    def __init__(self, service_name: str, environment: str):

        if not isinstance(service_name,str):
            raise TypeError("Service_name must be a string")
        
        if not isinstance(environment, str):
            raise TypeError("Environment must be a string")
        
        if not service_name:
            raise ValueError("service_name cannot be empty")
        
        if not environment:
            raise ValueError("Environment must not be empty")
        

        self.service_name=service_name
        self.environment=environment
        self.status='pending'
        self._history=[]

    
    def deploy(self, new_version:str):

        if not isinstance(new_version,str):
            raise TypeError("new version must be a empty string")
        
        if not new_version:
            raise ValueError("new version must not be empty")
        
        self._history.append(new_version)
        self.status='deployed'


    def rollback(self)->bool:

        if len(self._history)<2:
            return False
        
        self._history.pop()
        self.status='rolled_back'
        return True
    
    def check_status(self)-> dict:

        currrent_version= self._history[-1] if self._history else None
        return{

            'service_name':self.service_name,
            'environment': self.environment,
            'version': currrent_version,
            'staus':self.status
        }
    

d = Deployment("AuthService", "production")

print(d.check_status())
