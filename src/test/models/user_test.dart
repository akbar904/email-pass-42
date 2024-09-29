
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_flutter_app/models/user.dart';

void main() {
	group('User Model', () {
		// Test the User model's properties
		test('User model should correctly store email and password', () {
			final user = User(email: 'test@example.com', password: 'password123');
			expect(user.email, 'test@example.com');
			expect(user.password, 'password123');
		});

		// Test serialization to JSON
		test('User model should correctly serialize to JSON', () {
			final user = User(email: 'test@example.com', password: 'password123');
			final json = user.toJson();
			expect(json['email'], 'test@example.com');
			expect(json['password'], 'password123');
		});

		// Test deserialization from JSON
		test('User model should correctly deserialize from JSON', () {
			final json = {'email': 'test@example.com', 'password': 'password123'};
			final user = User.fromJson(json);
			expect(user.email, 'test@example.com');
			expect(user.password, 'password123');
		});
	});
}
