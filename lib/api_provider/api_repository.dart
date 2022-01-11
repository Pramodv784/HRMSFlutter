class ApiRepository {
  static final ApiRepository apiRepository = ApiRepository.internal();

  factory ApiRepository() {
    return apiRepository;
  }

  ApiRepository.internal();
  
// Future<> login() async {}
  
}