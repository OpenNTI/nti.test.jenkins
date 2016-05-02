import Test from '../index';

describe('Unit Tests', ()=> {

	xit ('Failing Test', () => {
		expect('foo').toEqual('bar');
	});

	it ('Passing Test', () => {
		expect(true).toBe(true);
	});

	it ('Cover Test Class', () => {
		const test = new Test();
		expect(test.foo()).toEqual('bar');
	});
});
