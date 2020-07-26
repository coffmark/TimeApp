
import Foundation
import Resolver

extension Resolver: ResolverRegistering{
    public static func registerAllServices(){
        register{
            TestDataTaskRepository() as TaskRepository
        }.scope(application)
    }
}
