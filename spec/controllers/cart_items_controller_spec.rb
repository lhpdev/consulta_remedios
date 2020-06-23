require 'rails_helper'

RSpec.describe CartItemsController, type: :controller do

  describe "POST add" do
    let(:medicine) { create(:medicine) }
    let(:cart) { create(:cart) }

    context 'with all params' do
      subject { 
        post :add, params: { customer_id: cart.customer.id, cart_id: cart.id, medicine_id: medicine.id, quantity: 1 }
      }

      it "adds item to cart" do
        expect{ subject }.to change { CartItem.all.count }.from(0).to(1)
      end

      it "gets correct flash message" do
        expect(subject.request.flash[:notice]).to match(/Item added succesfully*/)
      end
    end

    context 'missing params' do
      subject { 
        post :add, params: { customer_id: cart.customer.id, cart_id: cart.id, medicine_id: medicine.id }
      }

      it "does not add item to cart" do
        expect{ subject }.to_not change { CartItem.all.count }
      end

      it "gets correct flash message" do
        expect(subject.request.flash[:alert]).to match(/To add an item you need to inform the quantity*/)
      end
    end
  end

  describe "POST remove" do
    let(:medicine) { create(:medicine, stock: 3) }
    let!(:cart_item) { create(:cart_item, medicine: medicine, quantity: 1) }

    context 'with all params' do
      subject { 
        post :remove, params: { customer_id: cart_item.cart.customer.id, cart_id: cart_item.cart.id, cart_item_id: cart_item.id, quantity: 1 } 
      }

      it "deletes item from cart" do
        expect { subject }.to change { CartItem.all.count }.from(1).to(0)
      end

      it "increases the item medicine stock" do
        expect { subject }.to change { medicine.reload.stock }.from(3).to(4)
      end

      it "gets correct flash message" do
        expect(subject.request.flash[:notice]).to match(/Item removed succesfully*/)
      end
    end

    context 'missing params' do
      subject { 
        post :remove, params: { customer_id: cart_item.cart.customer.id, cart_id: cart_item.cart.id, cart_item_id: cart_item.id } 
      }

      it "deletes item from cart" do
        expect { subject }.to_not change { CartItem.all.count }
      end

      it "gets correct flash message" do
        expect(subject.request.flash[:alert]).to match(/To remove an item you need to inform the quantity*/)
      end
    end
  end
end