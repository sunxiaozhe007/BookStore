package dao;

import java.sql.SQLException;
import java.util.List;

import domain.Order;
import domain.OrderItem;
import org.apache.commons.dbutils.QueryRunner;
import util.ManagerThreadLocal;

public class OrderItemDao {
	//��Ӷ�����
	public void addOrderItem(Order order) throws SQLException{
		List<OrderItem> orderItems = order.getOrderItems();//�õ����ж�����ļ���
		QueryRunner qr = new QueryRunner();
		Object[][] params = new Object[orderItems.size()][];
		
		for (int i = 0; i < params.length; i++) {
			//�����еĵ�һ��������������id�� �ڶ�����������Ʒid ���������� ����Ʒ�Ĺ�������
			params[i] = new Object[]{order.getId(),orderItems.get(i).getP().getId(),orderItems.get(i).getBuynum()};
		}
		qr.batch(ManagerThreadLocal.getConnection(),"INSERT INTO orderitem VALUES(?,?,?)", params );
	}
}
