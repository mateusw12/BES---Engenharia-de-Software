package br.univille.estd.queues.array;

import br.univille.estd.queues.Queue;

public class ArrayQueue<E> implements Queue<E> {

	protected int f = 0;
	protected int r = 0;
	public static final int CAPACITY = 1000;
	protected int capacity;
	protected E Q[];
	public ArrayQueue() {
		this(CAPACITY);
	}
	public ArrayQueue(int capacity) {
		this.capacity = capacity;
		Q = (E[])new Object[this.capacity];
	}

	@Override
	public long size() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean isEmpty() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void enqueue(E e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public E dequeue() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public E front() {
		// TODO Auto-generated method stub
		return null;
	}

}
